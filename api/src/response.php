<?php

declare(strict_types=1);

function jsonResponse(array $payload, int $statusCode = 200): void
{
    http_response_code($statusCode);
    echo json_encode($payload, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    exit;
}

function jsonError(string $message, int $statusCode): void
{
    jsonResponse(
        [
            'ok' => false,
            'error' => [
                'message' => $message,
            ],
        ],
        $statusCode
    );
}
