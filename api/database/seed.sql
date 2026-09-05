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
