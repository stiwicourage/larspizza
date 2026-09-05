<?php

return [
    'app' => [
        'name' => 'Lars\' Pizza API',
        'environment' => 'production',
        'allowed_origins' => [
            'https://larspizza.dk',
            'https://stiwicourage.github.io',
        ],
    ],
    'database' => [
        'host' => 'mysql-host.example',
        'port' => 3306,
        'name' => 'database_name',
        'username' => 'database_user',
        'password' => 'database_password',
    ],
    'mail' => [
        'host' => 'smtp-host.example',
        'port' => 587,
        'username' => 'smtp_user',
        'password' => 'smtp_password',
        'from_address' => 'orders@example.com',
    ],
];
