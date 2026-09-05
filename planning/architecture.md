# Lars' Pizza architecture

## Formål

Beskriv den første tekniske opdeling af Lars' Pizza, så frontend, backend, data og deploy kan udvikles uden at blive blandet sammen.

## Systemoversigt

Løsningen deles i to hoveddele:

1. **GitHub Pages frontend**
   - statiske HTML-sider under `docs/`
   - fælles CSS og lille JavaScript
   - ansvar for brugerflow, UI og Tolgee-integration

2. **PHP API på GigaHost**
   - server-side endpoints under `api/public/`
   - supportkode under `api/src/`
   - ansvar for validering, MySQL-lagring og mailafsendelse

## Repo-struktur

```text
docs/
  index.html
  assets/
    css/
    js/
    images/

api/
  public/
    index.php
  src/
    bootstrap.php
    response.php
  config.example.php

planning/
  architecture.md
  mvp-plan.md
  backlog.md
```

## Ansvarsgrænser

### Frontend ejer

- sprogvalg og UI-tekster
- lokationsvalg
- menuvisning
- bestillingsformular
- review og kvitteringsvisning

### Backend ejer

- request-validering
- CORS og JSON-responses
- databaseforbindelse
- lagring af ordrer
- afsendelse af lokationsmail

### Database ejer

- lokationer
- globale menupunkter
- lokations-overrides
- ingredienser og standardmængder
- ordrer, ordrelinjer og recipients

## Deploy-retning

### GitHub Pages

- public website deployes fra `docs/`

### GigaHost

- PHP API deployes separat til webhotellet
- secrets holdes uden for repoet
- server-side konfiguration læser følsomme værdier fra lokal config eller miljø

## MVP-principper

- mobil-først
- lokation vælges før menuen vises
- mindst én pizza kræves
- samme pizza kan bestilles med antal
- review kræves før afsendelse
- kvittering vises kun på skærmen i MVP

## Næste tekniske skridt

1. Lås MySQL-skemat
2. Udbyg PHP API med rigtige endpoints
3. Byg frontend shell og Tolgee-grundlag
4. Kobl frontend og API sammen
