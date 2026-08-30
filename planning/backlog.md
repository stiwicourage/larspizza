# Lars' Pizza backlog

## Nu

### 1. Arkitektur og projektstruktur

**Mål**
- Lås frontend/backend-ansvar
- Lås repo-struktur for `docs/` og PHP API
- Lås deploy-retning for GitHub Pages og GigaHost

**Leverancer**
- Beskrevet arkitektur
- Besluttet mappestruktur
- Klar afgrænsning mellem frontend, backend og data

### 2. MySQL-datamodel og seed-data

**Mål**
- Designe tabeller til lokationer, menu, ordrer og recipients
- Forberede ingrediensgenbrug og senere indkøbslister

**Leverancer**
- SQL-schema
- Relationer og constraints
- Seed-data for Haslev og Lynge

### 3. PHP API-grundlag

**Mål**
- Etablere API-struktur, config, JSON-responses og CORS

**Leverancer**
- Grundlæggende PHP API
- Sikker config-strategi
- Deploybar backendstruktur

## MVP-implementering

### 4. Frontend shell og Tolgee-grundlag

**Mål**
- Fælles layout
- Mobil-først designramme
- Sprogvalg og lokaliserbare tekster

### 5. Lokation-først menuvisning

**Mål**
- Brugeren vælger lokation først
- Menuen viser kun relevante punkter
- Globale menunumre bevares

### 6. Bestillingsformular

**Mål**
- Dato, bestillernavn, pizzaer og antal
- Modtagernavne pr. faktisk pizza
- Tydelig mobilvenlig validering

### 7. Review, lagring og mail

**Mål**
- Review-step før send
- Persistent lagring i MySQL
- Mail til Haslev eller Lynge
- Kvittering på skærmen

### 8. Deploy-flow

**Mål**
- GitHub Pages deploy af `docs/`
- GigaHost deploy af PHP API
- GitHub environment `Gigahost`

## Efter MVP

### 9. Enkel intern indholdsadministration

- Vedligehold menu, lokationer og tilgængelighed uden fuldt admin-panel

### 10. Indkøbslisteforberedelse

- Aggregering pr. lokation og dato
- Genbrug af ingrediensstandarder

### 11. Senere udvidelser

- Emailkvittering til bestiller
- Admin-UI
- Ordrehistorik
- Sociale medier og YouTube-flader

## Statusnøgler

- `Nu` = næste opgaver, som bør afklares eller bygges først
- `MVP-implementering` = første leverbare version
- `Efter MVP` = bevidst udskudte forbedringer
