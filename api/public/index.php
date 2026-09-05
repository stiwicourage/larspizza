<?php

declare(strict_types=1);

require_once __DIR__ . '/src/bootstrap.php';

$config = loadConfig();

applyCors($config);
handlePreflight();

jsonResponse(
    [
        'ok' => true,
        'service' => 'Lars\' Pizza API',
        'version' => 1,
        'status' => 'ready-for-endpoints',
        'endpoints' => [
            'locations' => 'GET /locations.php',
            'menu' => 'GET /menu.php?location=<slug>',
            'orders' => 'POST /orders.php',
        ],
    ]
);
