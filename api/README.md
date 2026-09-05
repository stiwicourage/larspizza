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
- `src/` - fælles bootstrap- og response-hjælpere
- `database/` - MySQL-schema og seed-data
- `config.example.php` - eksempel på nødvendig konfiguration uden secrets

## Principper

- Secrets må ikke committes
- Frontend må ikke kende database- eller SMTP-adgang
- API'et skal returnere konsistente JSON-svar
- CORS skal begrænses til kendte frontend-domæner

## Næste endpoints

- `GET /api/locations`
- `GET /api/menu?location=<slug>`
- `POST /api/orders`

## Database

Kør først `database/schema.sql` og derefter `database/seed.sql` i MySQL.
Seed-data indeholder Haslev og Lynge samt de første 18 pizzaer med deres ingredienser.
Priser og ingrediensmængder er endnu ikke udfyldt.

## Første deploy-test

Første test bruger kun et simpelt health-style endpoint via den deployede `index.php`, så vi kan bekræfte:

- at PHP kører på GigaHost
- at filer kan deployes fra GitHub Actions
- at API-URL'en svarer med JSON

Workflowet ligger i `.github/workflows/deploy-api-test.yml` og uploader `index.php` samt `src/` direkte til underdomænets rod, så bootstrap-koden kan tilgås på `https://api.larspizza.dk/`.
