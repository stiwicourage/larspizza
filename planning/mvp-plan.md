# Lars' Pizza MVP plan

## Mål

Byg et mobil-først website, hvor familie og venner kan bestille pizza til en valgt lokation og dato.
Værten skal kunne se bestillingerne og bruge dem som grundlag for indkøb.

## MVP scope

- GitHub Pages-frontend under `docs/`
- PHP API hostet på GigaHost
- MySQL som persistent lagring
- SMTP-baseret mailafsendelse til valgt lokation eller vært
- Tolgee til oversættelser
- To lokationer fra start:
  - Haslev
  - Lynge

## Hovedflow

1. Brugeren åbner sitet
2. Brugeren vælger lokation
3. Brugeren ser menuen for den valgte lokation
4. Brugeren vælger dato
5. Brugeren bygger en ordre med mindst én pizza
6. Brugeren kan vælge antal af samme pizza
7. Brugeren angiver bestillernavn
8. Brugeren angiver modtagernavn pr. faktisk pizza
9. Brugeren ser review og bekræfter
10. Systemet gemmer ordren og sender mail til lokationen
11. Brugeren ser kvittering på skærmen

## Ikke med i MVP

- Betaling
- Kundelogin
- Emailkvittering til bestilleren
- Admin-panel
- Sociale medier og YouTube-integration
- Avancerede driftsregler

## Arkitektur

### Frontend

- Statiske sider i `docs/`
- Mobil-først HTML, CSS og lille JavaScript
- Tolgee til lokaliserbare tekster

### Backend

- PHP API på GigaHost
- Ansvar for validering, MySQL-lagring og mailafsendelse
- Secrets holdes uden for repoet

### Data

- MySQL til lokationer, menu, tilgængelighed, ordrer og ingrediensrelationer
- Globale menunumre genbruges på tværs af lokationer
- Lokationer kan skjule menupunkter uden at genbruge nummeret

## Datamodel-retning

Kerneområder:

- `locations`
- `menu_items`
- `location_menu_overrides`
- `ingredients`
- `ingredient_defaults`
- `menu_item_ingredients`
- `orders`
- `order_items`
- `order_item_recipients`

Priser og betaling er ikke en del af systemet. Senere skal ordredata kunne summeres
efter ingrediens og mængde, så værten får et praktisk indkøbsgrundlag.

## Definition of done for MVP

- Brugeren kan bestille fra mobil
- Lokation vælges før menuen vises
- Mindst én pizza kræves
- Antal pr. pizza understøttes
- Modtagernavn pr. faktisk pizza understøttes
- Review-step findes før afsendelse
- Ordren gemmes i MySQL
- Ordren mailes til korrekt lokation
- Kvittering vises på skærmen
- Værten kan se de indkomne ordrer
- Tekster er forberedt til flersprog
