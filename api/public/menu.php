<?php

declare(strict_types=1);

require_once __DIR__ . '/src/bootstrap.php';
require_once __DIR__ . '/src/database.php';

$config = loadConfig();
applyCors($config);
handlePreflight();

$locationSlug = trim((string) ($_GET['location'] ?? ''));
if ($locationSlug === '') {
    jsonError('The location parameter is required.', 400);
}

$sql = <<<'SQL'
SELECT
    menu.menu_number,
    menu.slug,
    {name},
    {description}
FROM menu_items AS menu
JOIN locations AS location ON location.slug = :location
LEFT JOIN location_menu_overrides AS override
    ON override.location_id = location.id
    AND override.menu_item_id = menu.id
WHERE menu.is_active = 1
  AND COALESCE(override.is_available, 1) = 1
ORDER BY menu.menu_number
SQL;

$sql = str_replace(
    ['{name}', '{description}'],
    [
        repairMojibake('menu.name') . ' AS name',
        repairMojibake('menu.description') . ' AS description',
    ],
    $sql
);

try {
    $statement = connectDatabase($config)->prepare($sql);
    $statement->execute(['location' => $locationSlug]);
    jsonResponse(['ok' => true, 'location' => $locationSlug, 'menu' => $statement->fetchAll()]);
} catch (PDOException $exception) {
    jsonError('Menu is temporarily unavailable.', 503);
}
