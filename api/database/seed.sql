INSERT INTO locations (slug, name)
VALUES
    ('haslev', 'Haslev'),
    ('lynge', 'Lynge')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO ingredients (slug, name)
VALUES
    ('tomatsauce', 'Tomatsauce'),
    ('ost', 'Ost'),
    ('revet-ost', 'Revet ost'),
    ('mozzarella', 'Mozzarella'),
    ('bøffelmozzarella', 'Bøffelmozzarella'),
    ('burrata', 'Burrata'),
    ('goudaost', 'Goudaost'),
    ('feta-puck', 'Feta (Puck)'),
    ('pizza-topping-ost', 'Pizza Topping-ost'),
    ('cheddarost', 'Cheddarost'),
    ('cocktailpølser', 'Cocktailpølser'),
    ('bacon', 'Bacon'),
    ('pepperoni', 'Pepperoni'),
    ('stærk-salami', 'Stærk salami'),
    ('skinke', 'Skinke'),
    ('kylling', 'Kylling'),
    ('kyllingestrimler', 'Kyllingestrimler'),
    ('pesto', 'Pesto'),
    ('grøn-pesto', 'Grøn pesto'),
    ('majs', 'Majs'),
    ('syltede-paprika', 'Syltede paprika'),
    ('kartofler', 'Kartofler'),
    ('tacokødsovs', 'Tacokødsovs'),
    ('peberfrugt', 'Peberfrugt'),
    ('jalapeños', 'Jalapeños'),
    ('oregano', 'Oregano'),
    ('kebab', 'Kebab'),
    ('salat', 'Salat'),
    ('tomat', 'Tomat'),
    ('agurk', 'Agurk'),
    ('cremefraiche-dressing', 'Cremefraiche-dressing'),
    ('hakket-oksekød', 'Hakket oksekød'),
    ('chiliflager', 'Chiliflager'),
    ('pølse', 'Pølse')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO menu_items (menu_number, slug, name)
VALUES
    (1, 'the-carnivore', 'The Carnivore'),
    (2, 'double-cheese', 'Double Cheese'),
    (3, 'the-split', 'The Split'),
    (4, 'chicken-pesto', 'Chicken Pesto'),
    (5, 'spicy-salami', 'Spicy Salami'),
    (6, 'patata-pesto', 'Patata Pesto'),
    (7, 'casa-piccante', 'Casa Piccante'),
    (8, 'prosciutto-classico', 'Prosciutto Classico'),
    (9, 'buffalo-cheese', 'Buffalo Cheese'),
    (10, 'buffalo-and-ham', 'Buffalo & Ham'),
    (11, 'pepperoni-prosciutto', 'Pepperoni Prosciutto'),
    (12, 'pepperoni-classic', 'Pepperoni Classic'),
    (13, 'mexicana', 'Mexicana'),
    (14, 'burrata-pesto', 'Burrata Pesto'),
    (15, 'kebab-special', 'Kebab Special'),
    (16, 'lars-special', 'Lars’ Special'),
    (17, 'quattro-formaggi-special', 'Quattro Formaggi Special'),
    (18, 'cheese-heaven', 'Cheese Heaven')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO menu_item_ingredients (menu_item_id, ingredient_id, sort_order)
SELECT menu.id, ingredient.id, pairs.sort_order
FROM (
    SELECT 'the-carnivore' AS menu_slug, 'tomatsauce' AS ingredient_slug, 1 AS sort_order
    UNION ALL SELECT 'the-carnivore', 'ost', 2
    UNION ALL SELECT 'the-carnivore', 'cocktailpølser', 3
    UNION ALL SELECT 'the-carnivore', 'bacon', 4
    UNION ALL SELECT 'the-carnivore', 'pepperoni', 5
    UNION ALL SELECT 'double-cheese', 'tomatsauce', 1
    UNION ALL SELECT 'double-cheese', 'revet-ost', 2
    UNION ALL SELECT 'double-cheese', 'mozzarella', 3
    UNION ALL SELECT 'the-split', 'tomatsauce', 1
    UNION ALL SELECT 'the-split', 'mozzarella', 2
    UNION ALL SELECT 'the-split', 'pepperoni', 3
    UNION ALL SELECT 'chicken-pesto', 'tomatsauce', 1
    UNION ALL SELECT 'chicken-pesto', 'mozzarella', 2
    UNION ALL SELECT 'chicken-pesto', 'kylling', 3
    UNION ALL SELECT 'chicken-pesto', 'pesto', 4
    UNION ALL SELECT 'chicken-pesto', 'majs', 5
    UNION ALL SELECT 'spicy-salami', 'tomatsauce', 1
    UNION ALL SELECT 'spicy-salami', 'mozzarella', 2
    UNION ALL SELECT 'spicy-salami', 'stærk-salami', 3
    UNION ALL SELECT 'spicy-salami', 'syltede-paprika', 4
    UNION ALL SELECT 'patata-pesto', 'tomatsauce', 1
    UNION ALL SELECT 'patata-pesto', 'mozzarella', 2
    UNION ALL SELECT 'patata-pesto', 'kartofler', 3
    UNION ALL SELECT 'patata-pesto', 'bacon', 4
    UNION ALL SELECT 'patata-pesto', 'pesto', 5
    UNION ALL SELECT 'casa-piccante', 'tomatsauce', 1
    UNION ALL SELECT 'casa-piccante', 'stærk-salami', 2
    UNION ALL SELECT 'casa-piccante', 'skinke', 3
    UNION ALL SELECT 'casa-piccante', 'goudaost', 4
    UNION ALL SELECT 'prosciutto-classico', 'tomatsauce', 1
    UNION ALL SELECT 'prosciutto-classico', 'mozzarella', 2
    UNION ALL SELECT 'prosciutto-classico', 'skinke', 3
    UNION ALL SELECT 'buffalo-cheese', 'tomatsauce', 1
    UNION ALL SELECT 'buffalo-cheese', 'revet-ost', 2
    UNION ALL SELECT 'buffalo-cheese', 'bøffelmozzarella', 3
    UNION ALL SELECT 'buffalo-and-ham', 'tomatsauce', 1
    UNION ALL SELECT 'buffalo-and-ham', 'revet-ost', 2
    UNION ALL SELECT 'buffalo-and-ham', 'bøffelmozzarella', 3
    UNION ALL SELECT 'buffalo-and-ham', 'skinke', 4
    UNION ALL SELECT 'pepperoni-prosciutto', 'tomatsauce', 1
    UNION ALL SELECT 'pepperoni-prosciutto', 'revet-ost', 2
    UNION ALL SELECT 'pepperoni-prosciutto', 'pepperoni', 3
    UNION ALL SELECT 'pepperoni-prosciutto', 'skinke', 4
    UNION ALL SELECT 'pepperoni-classic', 'tomatsauce', 1
    UNION ALL SELECT 'pepperoni-classic', 'revet-ost', 2
    UNION ALL SELECT 'pepperoni-classic', 'pepperoni', 3
    UNION ALL SELECT 'pepperoni-classic', 'oregano', 4
    UNION ALL SELECT 'mexicana', 'tomatsauce', 1
    UNION ALL SELECT 'mexicana', 'revet-ost', 2
    UNION ALL SELECT 'mexicana', 'tacokødsovs', 3
    UNION ALL SELECT 'mexicana', 'peberfrugt', 4
    UNION ALL SELECT 'mexicana', 'jalapeños', 5
    UNION ALL SELECT 'burrata-pesto', 'tomatsauce', 1
    UNION ALL SELECT 'burrata-pesto', 'burrata', 2
    UNION ALL SELECT 'burrata-pesto', 'kyllingestrimler', 3
    UNION ALL SELECT 'burrata-pesto', 'grøn-pesto', 4
    UNION ALL SELECT 'burrata-pesto', 'oregano', 5
    UNION ALL SELECT 'kebab-special', 'tomatsauce', 1
    UNION ALL SELECT 'kebab-special', 'revet-ost', 2
    UNION ALL SELECT 'kebab-special', 'kebab', 3
    UNION ALL SELECT 'kebab-special', 'salat', 4
    UNION ALL SELECT 'kebab-special', 'tomat', 5
    UNION ALL SELECT 'kebab-special', 'agurk', 6
    UNION ALL SELECT 'kebab-special', 'cremefraiche-dressing', 7
    UNION ALL SELECT 'lars-special', 'tomatsauce', 1
    UNION ALL SELECT 'lars-special', 'revet-ost', 2
    UNION ALL SELECT 'lars-special', 'hakket-oksekød', 3
    UNION ALL SELECT 'lars-special', 'syltede-paprika', 4
    UNION ALL SELECT 'lars-special', 'chiliflager', 5
    UNION ALL SELECT 'quattro-formaggi-special', 'tomatsauce', 1
    UNION ALL SELECT 'quattro-formaggi-special', 'goudaost', 2
    UNION ALL SELECT 'quattro-formaggi-special', 'revet-ost', 3
    UNION ALL SELECT 'quattro-formaggi-special', 'bøffelmozzarella', 4
    UNION ALL SELECT 'quattro-formaggi-special', 'feta-puck', 5
    UNION ALL SELECT 'quattro-formaggi-special', 'pølse', 6
    UNION ALL SELECT 'quattro-formaggi-special', 'majs', 7
    UNION ALL SELECT 'quattro-formaggi-special', 'pepperoni', 8
    UNION ALL SELECT 'cheese-heaven', 'tomatsauce', 1
    UNION ALL SELECT 'cheese-heaven', 'mozzarella', 2
    UNION ALL SELECT 'cheese-heaven', 'bøffelmozzarella', 3
    UNION ALL SELECT 'cheese-heaven', 'burrata', 4
    UNION ALL SELECT 'cheese-heaven', 'feta-puck', 5
    UNION ALL SELECT 'cheese-heaven', 'goudaost', 6
    UNION ALL SELECT 'cheese-heaven', 'pizza-topping-ost', 7
    UNION ALL SELECT 'cheese-heaven', 'cheddarost', 8
) AS pairs
JOIN menu_items AS menu ON menu.slug = pairs.menu_slug
JOIN ingredients AS ingredient ON ingredient.slug = pairs.ingredient_slug
ON DUPLICATE KEY UPDATE sort_order = VALUES(sort_order);

UPDATE menu_items
SET description = CASE slug
    WHEN 'the-carnivore' THEN 'En fyldig og smagfuld pizza med sprød bacon, krydret pepperoni og saftige cocktailpølser på en klassisk bund af tomatsauce og smeltet ost.'
    WHEN 'double-cheese' THEN 'En enkel pizza for osteelskere med to forskellige slags ost, der smelter sammen til et cremet og lækkert ostelag. Dobbelt op på ost, smag og cremethed.'
    WHEN 'the-split' THEN 'Det bedste fra to verdener – én halvdel klassisk Margherita med tomat og ost og én halvdel med krydret pepperoni. Perfekt, når man ikke vil vælge.'
    WHEN 'chicken-pesto' THEN 'En lækker og cremet pizza med saftig kylling og søde majs, hvor den friske pesto giver en dejlig smag og et ekstra pift. En mild og velsmagende favorit.'
    WHEN 'spicy-salami' THEN 'En smagfuld pizza med krydret og stærk salami, smeltet mozzarella og syltede paprika, som giver en dejlig syrlig kontrast. En pizza med masser af karakter og et godt spicy kick.'
    WHEN 'patata-pesto' THEN 'En lækker og fyldig pizza med tynde skiver kartoffel, sprød bacon og frisk, cremet pesto. Kombinationen af de milde kartofler, salte bacon og aromatiske pesto giver en fantastisk smag og dejlig mæthed.'
    WHEN 'casa-piccante' THEN 'En lækker og fyldig pizza med stærk salami og saftig skinke, toppet med smeltet gouda. En skøn kombination af krydret salami, mild skinke og cremet ost, der giver pizzaen masser af smag og karakter.'
    WHEN 'prosciutto-classico' THEN 'En klassisk og enkel pizza med mild, saftig skinke og cremet, smeltet mozzarella på en lækker bund med tomatsauce.'
    WHEN 'buffalo-cheese' THEN 'En enkel og klassisk italiensk pizza med smagfuld tomatsauce, cremet bøffelmozzarella og et lækkert lag revet ost. En ægte favorit for dem, der elsker den gode, simple pizzasmag.'
    WHEN 'buffalo-and-ham' THEN 'En klassisk pizza med smagfuld tomatsauce, cremet bøffelmozzarella, revet ost og lækker skinke. En enkel og harmonisk kombination, hvor de milde og salte smage går perfekt sammen.'
    WHEN 'pepperoni-prosciutto' THEN 'En klassisk og smagfuld pizza med fyldig tomatsauce, smeltet ost, krydret pepperoni og lækker skinke. En perfekt kombination af salt, krydret og cremet med masser af smag.'
    WHEN 'pepperoni-classic' THEN 'En klassisk og enkel pizza med fyldig tomatsauce, smeltet ost, krydret pepperoni og et strejf af aromatisk oregano. En sikker favorit for pizzaelskere.'
    WHEN 'mexicana' THEN 'En lækker og krydret pizza med fyldig tomatsauce, smeltet ost og saftig tacokødsovs, toppet med sprød peberfrugt og spicy jalapeños. En perfekt kombination af italiensk pizza og mexicansk smag.'
    WHEN 'burrata-pesto' THEN 'En cremet og smagfuld pizza med fyldig tomatsauce, saftig kylling og blød burrata. Grøn pesto og aromatisk oregano giver pizzaen et frisk og lækkert italiensk twist.'
    WHEN 'kebab-special' THEN 'En lækker og saftig pizza med fyldig tomatsauce, smeltet ost og krydret kebab. Frisk salat, tomat, agurk og cremet cremefraiche-dressing tilføjes efter bagning og giver pizzaen et sprødt og friskt twist.'
    WHEN 'lars-special' THEN 'Husets signaturpizza med fyldig tomatsauce, smeltet ost og saftigt hakket oksekød. Syltet paprika giver en let sødme og syrlighed, mens chiliflagerne sørger for et godt spicy kick.'
    WHEN 'quattro-formaggi-special' THEN 'En overdådig og smagfuld pizza med masser af fyld. Den krydrede pepperoni og pølse får selskab af søde majs og en skøn blanding af fire forskellige oste, som giver en cremet, fyldig og lækker smag.'
    WHEN 'cheese-heaven' THEN 'En overdådig ostefest med hele syv forskellige oste. Den cremede mozzarella, bøffelmozzarella og burrata kombineres med fyldig gouda, cheddar, feta og Pizza Topping-ost. En ekstra cremet og smagfuld pizza – skabt til den ægte osteelsker.'
    ELSE description
END
WHERE slug IN (
    'the-carnivore',
    'double-cheese',
    'the-split',
    'chicken-pesto',
    'spicy-salami',
    'casa-piccante',
    'prosciutto-classico',
    'patata-pesto',
    'buffalo-cheese',
    'buffalo-and-ham',
    'pepperoni-prosciutto',
    'pepperoni-classic',
    'mexicana',
    'burrata-pesto',
    'kebab-special',
    'lars-special',
    'quattro-formaggi-special',
    'cheese-heaven'
);

INSERT INTO location_menu_overrides (location_id, menu_item_id, is_available)
SELECT location.id, menu.id, FALSE
FROM locations AS location
JOIN menu_items AS menu ON menu.slug = 'lars-special'
WHERE location.slug = 'lynge'
ON DUPLICATE KEY UPDATE is_available = VALUES(is_available);
