# Lars' Pizza API

Denne mappe indeholder den kommende PHP API, som deployes til GigaHost og fungerer som mellemled mellem GitHub Pages-frontend, MySQL og SMTP.

## Formål

API'et skal:

- modtage bestillinger fra frontend
- validere data
- gemme ordrer i MySQL
- sende mail til korrekt lokation
- returnere JSON-svar til frontend

## Struktur

- `public/` - entrypoints som kan kaldes fra browser eller frontend
- `src/` - fælles bootstrap-, database- og response-hjælpere
- `database/` - MySQL-schema og seed-data
- `config.example.php` - eksempel på nødvendig konfiguration uden secrets

## Principper

- Secrets må ikke committes
- Frontend må ikke kende database- eller SMTP-adgang
- API'et skal returnere konsistente JSON-svar
- CORS skal begrænses til kendte frontend-domæner

## Læse-endpoints

- `GET /locations.php`
- `GET /menu.php?location=<slug>`
- `POST /orders.php`

## Database

Kør først `database/schema.sql` og derefter `database/seed.sql` i MySQL.
Seed-data indeholder Haslev og Lynge samt de første 18 pizzaer med deres ingredienser.
Der bruges ikke priser eller betaling; systemet registrerer kun, hvad familien og vennerne bestiller.
Ingrediensmængder til indkøb tilføjes senere.

GitHub Actions initialiserer databasen ved deploy med disse oplysninger:

- Host: `mysql8.gigahost.dk`
- Database: `ccsgc_larspizza`
- Bruger: GitHub Environment-variable `Gigahost/MYSQL_USERNAME`
- Password: GitHub Environment-secret `Gigahost/MYSQL_PASSWORD`

## Første deploy-test

Første test bruger kun et simpelt health-style endpoint via den deployede `index.php`, så vi kan bekræfte:

- at PHP kører på GigaHost
- at filer kan deployes fra GitHub Actions
- at API-URL'en svarer med JSON

Workflowet ligger i `.github/workflows/deploy-api-test.yml` og uploader `index.php` samt `src/` direkte til underdomænets rod, så bootstrap-koden kan tilgås på `https://api.larspizza.dk/`.
