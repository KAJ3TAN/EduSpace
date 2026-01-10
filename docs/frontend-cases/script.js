/**
 * AWS API Service Mock
 * Symuluje komunikację z backendem (np. AWS Lambda / DynamoDB)
 */
const AwsApiService = {
    baseUrl: 'https://api.eduspace.aws/v1', // Placeholder dla przyszłego backendu

    // Symulacja opóźnienia sieciowego
    async mockFetch(endpoint) {
        return new Promise((resolve) => {
            setTimeout(() => {
                const data = this.getMockData(endpoint);
                resolve(data);
            }, 600); // 600ms opóźnienia dla realizmu
        });
    },

    getMockData(endpoint) {
        switch(endpoint) {
            case 'grades':
                return [
                    { id: 1, subject: 'Cloud Computing', grade: 5, weight: 3, date: '2023-10-12', desc: 'Sprawdzian - Funkcje' },
                    { id: 2, subject: 'Język Polski', grade: 4, weight: 2, date: '2023-10-10', desc: 'Wypracowanie' },
                    { id: 3, subject: 'Fizyka', grade: 2, weight: 3, date: '2023-10-08', desc: 'Kartkówka - Dynamika' },
                    { id: 4, subject: 'Informatyka', grade: 6, weight: 1, date: '2023-10-05', desc: 'Projekt strony WWW' },
                ];
            case 'schedule':
                return [
                    { day: 'Poniedziałek', lessons: ['Matematyka', 'WF', 'J. Angielski', 'Historia'] },
                    { day: 'Wtorek', lessons: ['Fizyka', 'Fizyka', 'J. Polski', 'Informatyka'] },
                    { day: 'Środa', lessons: ['Biologia', 'Chemia', 'Matematyka', 'Godz. Wych.'] },
                    { day: 'Czwartek', lessons: ['J. Angielski', 'Geografia', 'WOS', 'WF'] },
                    { day: 'Piątek', lessons: ['J. Polski', 'J. Polski', 'Religia/Etyka', 'Matematyka'] },
                ];
            default:
                return { message: 'Witaj na pulpicie Edu Space' };
        }
    },

    // Metoda gotowa do podpięcia prawdziwego AWS w przyszłości
    async getData(endpoint) {
        // W przyszłości odkomentuj poniższe:
        // const response = await fetch(`${this.baseUrl}/${endpoint}`);
        // return await response.json();
        
        console.log(`[AWS Cloud] Fetching data for: ${endpoint}...`);
        return this.mockFetch(endpoint);
    }
};

/**
 * Router i Renderowanie Widoków
 */
const router = {
    viewContainer: document.getElementById('app-view'),
    pageTitle: document.getElementById('page-title'),
    navButtons: document.querySelectorAll('.nav-links button'),

    async loadPage(pageName) {
        // 1. UI Loading State
        this.viewContainer.innerHTML = '<div class="loader">Pobieranie danych z chmury...</div>';
        this.updateActiveNav(pageName);

        // 2. Pobranie danych (Symulacja AWS)
        try {
            const data = await AwsApiService.getData(pageName);
            this.render(pageName, data);
        } catch (error) {
            this.viewContainer.innerHTML = `<div class="error">Błąd połączenia z AWS: ${error.message}</div>`;
        }
    },

    updateActiveNav(pageName) {
        this.navButtons.forEach(btn => btn.removeAttribute('aria-current'));
        const activeBtn = document.getElementById(`nav-${pageName}`);
        if(activeBtn) activeBtn.setAttribute('aria-current', 'page');
    },

    render(pageName, data) {
        let htmlContent = '';

        if (pageName === 'grades') {
            this.pageTitle.innerText = 'Twoje Oceny';
            htmlContent = this.generateGradesTable(data);
        } else if (pageName === 'schedule') {
            this.pageTitle.innerText = 'Plan Zajęć';
            htmlContent = this.generateScheduleGrid(data);
        } else {
            this.pageTitle.innerText = 'Pulpit';
            htmlContent = `<div class="card"><h3>Witaj w Edu Space!</h3><p>Wybierz zakładkę z menu, aby zobaczyć szczegóły.</p></div>`;
        }

        // Fade-in effect
        this.viewContainer.style.opacity = 0;
        this.viewContainer.innerHTML = htmlContent;
        setTimeout(() => this.viewContainer.style.opacity = 1, 50);
        this.viewContainer.style.transition = 'opacity 0.3s ease-in';
    },

    // Helper: Generowanie tabeli ocen
    generateGradesTable(grades) {
        if (!grades.length) return '<p>Brak ocen.</p>';
        
        const rows = grades.map(g => {
            const gradeClass = g.grade >= 4 ? 'grade-good' : (g.grade < 3 ? 'grade-bad' : '');
            return `
                <tr>
                    <td><strong>${g.subject}</strong></td>
                    <td><span class="grade-badge ${gradeClass}">${g.grade}</span></td>
                    <td>${g.desc}</td>
                    <td>${g.date}</td>
                </tr>
            `;
        }).join('');

        return `
            <div class="card">
                <table class="accessible-table" aria-label="Tabela ocen">
                    <thead>
                        <tr>
                            <th scope="col">Przedmiot</th>
                            <th scope="col">Ocena</th>
                            <th scope="col">Opis</th>
                            <th scope="col">Data</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${rows}
                    </tbody>
                </table>
            </div>
        `;
    },

    // Helper: Generowanie planu
    generateScheduleGrid(schedule) {
        const cards = schedule.map(day => {
            const lessonsList = day.lessons.map((lesson, idx) => 
                `<li style="padding: 5px 0; border-bottom: 1px solid #eee;">${idx + 1}. ${lesson}</li>`
            ).join('');

            return `
                <div class="card">
                    <h3 style="margin-bottom: 1rem; color: var(--primary-color);">${day.day}</h3>
                    <ol style="list-style: none; padding: 0;">
                        ${lessonsList}
                    </ol>
                </div>
            `;
        }).join('');

        return `<div class="schedule-grid">${cards}</div>`;
    }
};

// Inicjalizacja: Załaduj Pulpit na start
document.addEventListener('DOMContentLoaded', () => {
    router.loadPage('dashboard');

});
