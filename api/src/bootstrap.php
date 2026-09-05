<?php

declare(strict_types=1);

require_once __DIR__ . '/response.php';

function loadConfig(): array
{
    $configPath = dirname(__DIR__) . '/config.php';

    if (!is_file($configPath)) {
        return [
            'app' => [
                'allowed_origins' => [],
            ],
        ];
    }

    $config = require $configPath;

    if (!is_array($config)) {
        jsonError('Server configuration is invalid.', 500);
    }

    return $config;
}

function applyCors(array $config): void
{
    $origin = $_SERVER['HTTP_ORIGIN'] ?? '';
    $allowedOrigins = $config['app']['allowed_origins'] ?? [];

    if ($origin !== '' && in_array($origin, $allowedOrigins, true)) {
        header('Access-Control-Allow-Origin: ' . $origin);
        header('Vary: Origin');
    }

    header('Access-Control-Allow-Headers: Content-Type');
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
    header('Content-Type: application/json; charset=utf-8');
}

function handlePreflight(): void
{
    if (($_SERVER['REQUEST_METHOD'] ?? '') === 'OPTIONS') {
        http_response_code(204);
        exit;
    }
}
