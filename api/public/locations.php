<?php

declare(strict_types=1);

require_once __DIR__ . '/src/bootstrap.php';
require_once __DIR__ . '/src/database.php';

$config = loadConfig();
applyCors($config);
handlePreflight();

try {
    $locations = connectDatabase($config)
        ->query('SELECT slug, name FROM locations WHERE is_active = 1 ORDER BY name')
        ->fetchAll();
} catch (PDOException $exception) {
    jsonError('Locations are temporarily unavailable.', 503);
}

jsonResponse(['ok' => true, 'locations' => $locations]);
