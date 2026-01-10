TC-001: Rejestracja nowego studenta
•	Warunki wstępne: Użytkownik nie posiada konta w systemie
•	Kroki:
1.	Otwórz stronę rejestracji
2.	Wybierz typ konta "Student"
3.	Wypełnij formularz (email, hasło, imię, nazwisko, numer indeksu)
4.	Zaakceptuj regulamin
5.	Kliknij "Zarejestruj się"
•	Oczekiwany rezultat: Konto zostaje utworzone, na email wysłany jest link aktywacyjny
•	Priorytet: Wysoki
TC-002: Logowanie z poprawnymi danymi
•	Warunki wstępne: Użytkownik posiada aktywne konto
•	Kroki:
1.	Otwórz stronę logowania
2.	Wprowadź poprawny email i hasło
3.	Kliknij "Zaloguj"
•	Oczekiwany rezultat: Użytkownik zostaje przekierowany na dashboard
•	Priorytet: Krytyczny
TC-003: Logowanie z nieprawidłowym hasłem
•	Warunki wstępne: Użytkownik posiada konto
•	Kroki:
1.	Wprowadź poprawny email
2.	Wprowadź błędne hasło
3.	Kliknij "Zaloguj"
•	Oczekiwany rezultat: Wyświetla się komunikat błędu, użytkownik pozostaje na stronie logowania
•	Priorytet: Wysoki
Moduł zarządzania kursami (Nauczyciel)
TC-004: Tworzenie nowego kursu
•	Warunki wstępne: Użytkownik zalogowany jako nauczyciel
•	Kroki:
1.	Przejdź do zakładki "Moje kursy"
2.	Kliknij "Utwórz nowy kurs"
3.	Wypełnij dane: nazwa kursu, opis, semestr, limit miejsc
4.	Wybierz widoczność kursu
5.	Zapisz kurs
•	Oczekiwany rezultat: Kurs zostaje utworzony i pojawia się na liście kursów nauczyciela
•	Priorytet: Krytyczny
TC-005: Dodawanie materiałów do kursu
•	Warunki wstępne: Nauczyciel ma utworzony kurs
•	Kroki:
1.	Otwórz szczegóły kursu
2.	Kliknij "Dodaj materiały"
3.	Wybierz typ materiału (PDF, prezentacja, wideo)
4.	Prześlij plik (max 100 MB)
5.	Wprowadź nazwę i opis materiału
6.	Zapisz
•	Oczekiwany rezultat: Materiał zostaje dodany i jest widoczny w sekcji "Materiały kursu"
•	Priorytet: Wysoki
TC-006: Tworzenie zadania z terminem
•	Warunki wstępne: Nauczyciel ma aktywny kurs ze studentami
•	Kroki:
1.	Przejdź do kursu
2.	Kliknij "Dodaj zadanie"
3.	Wprowadź tytuł, opis, punktację maksymalną
4.	Ustaw termin oddania
5.	Dodaj załączniki (opcjonalnie)
6.	Publikuj zadanie
•	Oczekiwany rezultat: Zadanie jest widoczne dla studentów, system wysyła powiadomienie
•	Priorytet: Krytyczny
Moduł uczestnictwa w kursach (Student)
TC-007: Zapisanie się na kurs
•	Warunki wstępne: Student zalogowany, kurs ma wolne miejsca
•	Kroki:
1.	Przejdź do katalogu kursów
2.	Wyszukaj kurs po nazwie lub kodzie
3.	Kliknij "Szczegóły kursu"
4.	Kliknij "Zapisz się"
•	Oczekiwany rezultat: Student zostaje dodany do kursu, kurs pojawia się w "Moje kursy"
•	Priorytet: Krytyczny
TC-008: Pobieranie materiałów kursu
•	Warunki wstępne: Student zapisany na kurs z materiałami
•	Kroki:
1.	Otwórz kurs z listy "Moje kursy"
2.	Przejdź do sekcji "Materiały"
3.	Kliknij ikonę pobierania przy wybranym materiale
•	Oczekiwany rezultat: Plik zostaje pobrany na urządzenie studenta
•	Priorytet: Średni
TC-009: Oddawanie zadania
•	Warunki wstępne: Student ma przypisane zadanie
•	Kroki:
1.	Otwórz kurs
2.	Przejdź do zakładki "Zadania"
3.	Kliknij na zadanie do oddania
4.	Prześlij plik z rozwiązaniem
5.	Dodaj komentarz (opcjonalnie)
6.	Kliknij "Oddaj zadanie"
•	Oczekiwany rezultat: Zadanie zostaje przesłane, wyświetla się potwierdzenie, nauczyciel otrzymuje powiadomienie
•	Priorytet: Krytyczny
TC-010: Próba oddania zadania po terminie
•	Warunki wstępne: Student ma zadanie z przekroczonym terminem
•	Kroki:
1.	Otwórz zadanie po terminie
2.	Spróbuj przesłać plik
•	Oczekiwany rezultat: System wyświetla ostrzeżenie o przekroczonym terminie, zadanie jest oznaczone jako spóźnione
•	Priorytet: Wysoki
Moduł komunikacji
TC-011: Wysyłanie wiadomości do nauczyciela
•	Warunki wstępne: Student zapisany na kurs
•	Kroki:
1.	Przejdź do profilu nauczyciela lub karty kursu
2.	Kliknij "Wyślij wiadomość"
3.	Wprowadź temat i treść
4.	Kliknij "Wyślij"
•	Oczekiwany rezultat: Wiadomość zostaje dostarczona, nauczyciel otrzymuje powiadomienie
•	Priorytet: Średni
TC-012: Ogłoszenie na forum kursu
•	Warunki wstępne: Nauczyciel ma aktywny kurs
•	Kroki:
1.	Otwórz kurs
2.	Przejdź do zakładki "Forum"
3.	Kliknij "Nowe ogłoszenie"
4.	Wprowadź tytuł i treść
5.	Opublikuj
•	Oczekiwany rezultat: Ogłoszenie jest widoczne dla wszystkich uczestników kursu
•	Priorytet: Średni
Moduł oceniania
TC-013: Ocenianie oddanego zadania
•	Warunki wstępne: Student oddał zadanie
•	Kroki:
1.	Nauczyciel otwiera listę oddanych zadań
2.	Wybiera zadanie studenta
3.	Pobiera i sprawdza plik
4.	Wprowadza ocenę punktową
5.	Dodaje komentarz zwrotny
6.	Zapisuje ocenę
•	Oczekiwany rezultat: Ocena jest zapisana, student otrzymuje powiadomienie z oceną i komentarzem
•	Priorytet: Krytyczny
TC-014: Przeglądanie ocen przez studenta
•	Warunki wstępne: Student ma ocenione zadania
•	Kroki:
1.	Przejdź do zakładki "Oceny"
2.	Wybierz kurs
3.	Wyświetl szczegóły ocen
•	Oczekiwany rezultat: Student widzi wszystkie swoje oceny z komentarzami nauczyciela
•	Priorytet: Średni
Moduł quizów i testów
TC-015: Tworzenie quizu przez nauczyciela
•	Warunki wstępne: Nauczyciel ma aktywny kurs
•	Kroki:
1.	Kliknij "Dodaj quiz"
2.	Wprowadź nazwę i czas trwania
3.	Dodaj pytania (jednokrotnego wyboru, wielokrotnego wyboru, otwarte)
4.	Ustaw punktację za każde pytanie
5.	Ustaw termin dostępności
6.	Opublikuj quiz
•	Oczekiwany rezultat: Quiz jest widoczny dla studentów w określonym terminie
•	Priorytet: Wysoki
TC-016: Rozwiązywanie quizu przez studenta
•	Warunki wstępne: Student ma dostęp do opublikowanego quizu
•	Kroki:
1.	Otwórz quiz
2.	Kliknij "Rozpocznij"
3.	Odpowiedz na pytania
4.	Kliknij "Zakończ i prześlij"
•	Oczekiwany rezultat: Odpowiedzi są zapisane, automatycznie oceniane pytania pokazują wynik natychmiast
•	Priorytet: Wysoki
TC-017: Automatyczne zamknięcie quizu po upływie czasu
•	Warunki wstępne: Student rozpoczął quiz z limitem czasowym
•	Kroki:
1.	Rozpocznij quiz
2.	Poczekaj na upływ czasu bez zakończenia quizu
•	Oczekiwany rezultat: System automatycznie przesyła odpowiedzi i kończy quiz
•	Priorytet: Wysoki
Moduł powiadomień
TC-018: Powiadomienie o nowym zadaniu
•	Warunki wstępne: Student zapisany na kurs
•	Kroki:
1.	Nauczyciel publikuje nowe zadanie
2.	Sprawdź powiadomienia studenta
•	Oczekiwany rezultat: Student otrzymuje powiadomienie email i w systemie o nowym zadaniu
•	Priorytet: Średni
TC-019: Przypomnienie o zbliżającym się terminie
•	Warunki wstępne: Student ma nieodane zadanie z terminem za 24h
•	Kroki:
1.	Sprawdź powiadomienia studenta
•	Oczekiwany rezultat: System wysyła przypomnienie o zbliżającym się terminie
•	Priorytet: Średni
Moduł administracyjny
TC-020: Zarządzanie użytkownikami przez administratora
•	Warunki wstępne: Zalogowany administrator systemu
•	Kroki:
1.	Przejdź do panelu administracyjnego
2.	Kliknij "Zarządzanie użytkownikami"
3.	Wyszukaj użytkownika
4.	Zmień rolę lub dezaktywuj konto
•	Oczekiwany rezultat: Zmiany są natychmiast widoczne, użytkownik otrzymuje powiadomienie
•	Priorytet: Wysoki
TC-021: Generowanie raportu aktywności kursu
•	Warunki wstępne: Nauczyciel ma kurs ze studentami
•	Kroki:
1.	Otwórz statystyki kursu
2.	Wybierz zakres dat
3.	Kliknij "Generuj raport"
4.	Wybierz format (PDF/Excel)
•	Oczekiwany rezultat: Raport zawiera dane o frekwencji, oddanych zadaniach, średnich ocenach
•	Priorytet: Średni
Testy bezpieczeństwa
TC-022: Próba SQL Injection w formularzu logowania
•	Kroki:
1.	W polu email wprowadź: admin' OR '1'='1
2.	Wprowadź dowolne hasło
3.	Kliknij "Zaloguj"
•	Oczekiwany rezultat: System odrzuca próbę logowania, nie dochodzi do naruszenia bezpieczeństwa
•	Priorytet: Krytyczny
TC-023: Próba dostępu do materiałów kursu bez autoryzacji
•	Warunki wstępne: Użytkownik niezalogowany
•	Kroki:
1.	Skopiuj bezpośredni link do materiału kursu
2.	Wklej w przeglądarkę w trybie incognito
•	Oczekiwany rezultat: System przekierowuje do strony logowania
•	Priorytet: Krytyczny
TC-024: Weryfikacja siły hasła podczas rejestracji
•	Kroki:
1.	Rozpocznij rejestrację
2.	Wprowadź słabe hasło (np. "123456")
3.	Spróbuj kontynuować
•	Oczekiwany rezultat: System wyświetla komunikat o wymaganiach dotyczących hasła (min. 8 znaków, litery, cyfry, znaki specjalne)
•	Priorytet: Wysoki
Testy wydajnościowe
TC-025: Jednoczesny upload wielu plików
•	Warunki wstępne: Nauczyciel ma kurs
•	Kroki:
1.	Wybierz 10 plików różnych formatów (łącznie 500 MB)
2.	Prześlij wszystkie jednocześnie
•	Oczekiwany rezultat: Wszystkie pliki zostają przesłane, czas uploadu nie przekracza 2 minut przy standardowym połączeniu
•	Priorytet: Średni
TC-026: Test obciążenia - 100 studentów oddaje zadanie jednocześnie
•	Warunki wstępne: Przygotowane 100 kont testowych
•	Kroki:
1.	Symuluj jednoczesne oddanie zadania przez 100 studentów
2.	Monitoruj czas odpowiedzi systemu
•	Oczekiwany rezultat: System przetwarza wszystkie zgłoszenia, czas odpowiedzi nie przekracza 5 sekund
•	Priorytet: Wysoki
Testy kompatybilności
TC-027: Dostęp z urządzenia mobilnego
•	Kroki:
1.	Otwórz platformę na smartfonie (iOS/Android)
2.	Wykonaj podstawowe operacje: logowanie, przeglądanie kursów, oddanie zadania
•	Oczekiwany rezultat: Interfejs jest responsywny, wszystkie funkcje działają poprawnie
•	Priorytet: Wysoki
TC-028: Kompatybilność z różnymi przeglądarkami
•	Kroki:
1.	Otwórz platformę w Chrome, Firefox, Safari, Edge
2.	Wykonaj podstawowe operacje w każdej przeglądarce
•	Oczekiwany rezultat: Platforma działa poprawnie we wszystkich przeglądarkach
•	Priorytet: Wysoki
Testy użyteczności
TC-029: Nawigacja dla nowego użytkownika
•	Warunki wstępne: Nowy użytkownik po pierwszym logowaniu
•	Kroki:
1.	Zaloguj się po raz pierwszy
2.	Sprawdź czy wyświetla się tutorial/poradnik
3.	Spróbuj znaleźć główne funkcje bez pomocy
•	Oczekiwany rezultat: Użytkownik łatwo znajduje podstawowe funkcje, interfejs jest intuicyjny
•	Priorytet: Średni
TC-030: Dostępność dla osób z niepełnosprawnościami
•	Kroki:
1.	Nawiguj po stronie używając tylko klawiatury
2.	Sprawdź kontrast kolorów
3.	Przetestuj z czytnikiem ekranu
•	Oczekiwany rezultat: Strona spełnia standardy WCAG 2.1 poziom AA
•	Priorytet: Wysoki

