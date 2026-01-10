
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE order_status AS ENUM ('pending', 'paid', 'shipped', 'delivered', 'cancelled');
CREATE TYPE user_role AS ENUM ('admin', 'moderator', 'customer', 'guest');

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    password_hash TEXT NOT NULL,
    role user_role DEFAULT 'customer',
    is_active BOOLEAN DEFAULT true,
    last_login TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE user_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id UUID UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(20),
    address_line1 TEXT,
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);

-- Kategorie produktów (Relacja rekurencyjna - drzewiasta)
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    parent_id INTEGER REFERENCES categories(category_id),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(120) UNIQUE NOT NULL,
    description TEXT
);

-- Produkty z logiką magazynową
CREATE TABLE products (
    product_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    category_id INTEGER REFERENCES categories(category_id),
    sku VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(12, 2) NOT NULL CHECK (price >= 0),
    discount_price DECIMAL(12, 2) CHECK (discount_price < price),
    stock_quantity INTEGER DEFAULT 0 CHECK (stock_quantity >= 0),
    is_visible BOOLEAN DEFAULT true,
    metadata JSONB, -- Przechowywanie dynamicznych cech produktu
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Zamówienia
CREATE TABLE orders (
    order_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(user_id),
    status order_status DEFAULT 'pending',
    total_amount DECIMAL(12, 2) DEFAULT 0.00,
    shipping_address TEXT NOT NULL,
    tracking_number VARCHAR(100),
    placed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Pozycje w zamówieniu (Relacja many-to-many z danymi historycznymi)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id UUID REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(12, 2) NOT NULL -- Zachowanie ceny z momentu zakupu
);

-- Audyt logi (Śledzenie zmian w systemie)
CREATE TABLE audit_logs (
    log_id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(50),
    operation VARCHAR(10),
    old_data JSONB,
    new_data JSONB,
    changed_by UUID REFERENCES users(user_id),
    changed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. INDEKSY DLA WYDAJNOŚCI
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_products_fulltext ON products USING gin(to_tsvector('polish', name || ' ' || description));

-- 5. FUNKCJE I PROCEDURY (LOGIKA BACKENDOWA)

-- Automatyczna aktualizacja pola updated_at
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Funkcja realizująca zakup (zmniejszanie stanu magazynowego)
CREATE OR REPLACE FUNCTION process_order_stock()
RETURNS TRIGGER AS $$
BEGIN
    -- Sprawdź czy jest wystarczająca ilość towaru
    IF (SELECT stock_quantity FROM products WHERE product_id = NEW.product_id) < NEW.quantity THEN
        RAISE EXCEPTION 'Niewystarczająca ilość produktu w magazynie (ID: %)', NEW.product_id;
    END IF;

    -- Zmniejsz stan magazynowy
    UPDATE products 
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Procedura rejestracji użytkownika z automatycznym profilem
CREATE OR REPLACE PROCEDURE register_user(
    p_email VARCHAR,
    p_password TEXT,
    p_first_name VARCHAR,
    p_last_name VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    new_user_id UUID;
BEGIN
    INSERT INTO users (email, password_hash)
    VALUES (p_email, p_password)
    RETURNING user_id INTO new_user_id;

    INSERT INTO user_profiles (user_id, first_name, last_name)
    VALUES (new_user_id, p_first_name, p_last_name);
    
    COMMIT;
END;
$$;

-- 6. TRIGGERY

-- Aplikowanie updated_at do tabel
CREATE TRIGGER set_timestamp_users BEFORE UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp_products BEFORE UPDATE ON products FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp_orders BEFORE UPDATE ON orders FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();

-- Automatyczna obsługa magazynu przy dodawaniu pozycji do zamówienia
CREATE TRIGGER trg_process_stock
AFTER INSERT ON order_items
FOR EACH ROW EXECUTE PROCEDURE process_order_stock();

-- 7. WIDOKI (WARSTWA RAPORTOWA)

-- Widok podsumowujący sprzedaż produktów
CREATE VIEW v_sales_report AS
SELECT 
    p.name AS product_name,
    c.name AS category_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.price_at_purchase) AS total_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name, c.name
ORDER BY total_revenue DESC;

-- Widok aktywnych zamówień dla admina
CREATE VIEW v_active_orders AS
SELECT 
    o.order_id,
    u.email,
    o.total_amount,
    o.status,
    o.placed_at
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE o.status NOT IN ('delivered', 'cancelled');

-- 8. PRZYKŁADOWE DANE (SEEDING)
INSERT INTO categories (name, slug) VALUES ('Elektronika', 'elektronika'), ('Dom i Ogród', 'dom-i-ogrod');

-- Rejestracja admina przez procedurę (symulacja backendu)
CALL register_user('admin@system.pl', 'hashed_password_123', 'Jan', 'Administrator');

-- Dodanie produktu
INSERT INTO products (category_id, sku, name, price, stock_quantity)
VALUES (1, 'LAP-001', 'Laptop Gamingowy X', 4500.00, 10);
