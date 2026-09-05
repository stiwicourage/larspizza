<?php

declare(strict_types=1);

function connectDatabase(array $config): PDO
{
    $database = $config['database'] ?? [];
    $dsn = buildDatabaseDsn($database);
    $pdo = new PDO($dsn, $database['username'] ?? '', $database['password'] ?? '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $pdo->exec('SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci');
    return $pdo;
}

function buildDatabaseDsn(array $database): string
{
    $host = $database['host'] ?? '';
    $port = $database['port'] ?? 3306;
    $name = $database['name'] ?? '';
    return "mysql:host=$host;port=$port;dbname=$name;charset=utf8mb4";
}
