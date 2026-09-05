<?php

declare(strict_types=1);

require_once __DIR__ . '/src/bootstrap.php';
require_once __DIR__ . '/src/database.php';

$config = loadConfig();
applyCors($config);
handlePreflight();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    jsonError('Only POST requests are supported.', 405);
}

$payload = json_decode(file_get_contents('php://input'), true);
if (!is_array($payload)) {
    jsonError('The request body must be valid JSON.', 400);
}

$location = trim((string) ($payload['location'] ?? ''));
$date = trim((string) ($payload['order_date'] ?? ''));
$customer = trim((string) ($payload['customer_name'] ?? ''));
$items = $payload['items'] ?? [];
validateOrderInput($location, $date, $customer, $items);

try {
    $pdo = connectDatabase($config);
    $locationId = findLocationId($pdo, $location);
    $pdo->beginTransaction();
    $orderId = createOrder($pdo, $locationId, $date, $customer);
    saveOrderItems($pdo, $orderId, $locationId, $items);
    $pdo->commit();
    jsonResponse(['ok' => true, 'order_id' => $orderId], 201);
} catch (PDOException $exception) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    jsonError('The order could not be saved.', 503);
}

function validateOrderInput(string $location, string $date, string $customer, mixed $items): void
{
    $validDate = DateTimeImmutable::createFromFormat('!Y-m-d', $date);
    if ($location === '' || $customer === '' || !$validDate || $validDate->format('Y-m-d') !== $date) {
        jsonError('Location, date and customer name are required.', 422);
    }
    if (!is_array($items) || $items === []) {
        jsonError('At least one pizza is required.', 422);
    }
}

function findLocationId(PDO $pdo, string $slug): int
{
    $statement = $pdo->prepare('SELECT id FROM locations WHERE slug = :slug AND is_active = 1');
    $statement->execute(['slug' => $slug]);
    $id = $statement->fetchColumn();
    if ($id === false) {
        jsonError('The selected location is not available.', 422);
    }
    return (int) $id;
}

function createOrder(PDO $pdo, int $locationId, string $date, string $customer): int
{
    $statement = $pdo->prepare(
        'INSERT INTO orders (location_id, order_date, customer_name) VALUES (:location, :date, :customer)'
    );
    $statement->execute(['location' => $locationId, 'date' => $date, 'customer' => $customer]);
    return (int) $pdo->lastInsertId();
}

function saveOrderItems(PDO $pdo, int $orderId, int $locationId, array $items): void
{
    foreach ($items as $item) {
        $slug = trim((string) ($item['menu_slug'] ?? ''));
        $recipients = $item['recipients'] ?? [];
        if ($slug === '' || !is_array($recipients) || $recipients === []) {
            jsonError('Each pizza needs at least one recipient.', 422);
        }
        $menuId = findAvailableMenuId($pdo, $locationId, $slug);
        $orderItemId = insertOrderItem($pdo, $orderId, $menuId, count($recipients));
        insertRecipients($pdo, $orderItemId, $recipients);
    }
}

function findAvailableMenuId(PDO $pdo, int $locationId, string $slug): int
{
    $sql = 'SELECT menu.id FROM menu_items AS menu
        LEFT JOIN location_menu_overrides AS override
        ON override.menu_item_id = menu.id AND override.location_id = :location
        WHERE menu.slug = :slug AND menu.is_active = 1
        AND COALESCE(override.is_available, 1) = 1';
    $statement = $pdo->prepare($sql);
    $statement->execute(['location' => $locationId, 'slug' => $slug]);
    $id = $statement->fetchColumn();
    if ($id === false) {
        jsonError('One of the selected pizzas is not available.', 422);
    }
    return (int) $id;
}

function insertOrderItem(PDO $pdo, int $orderId, int $menuId, int $quantity): int
{
    $statement = $pdo->prepare(
        'INSERT INTO order_items (order_id, menu_item_id, quantity) VALUES (:order, :menu, :quantity)'
    );
    $statement->execute(['order' => $orderId, 'menu' => $menuId, 'quantity' => $quantity]);
    return (int) $pdo->lastInsertId();
}

function insertRecipients(PDO $pdo, int $orderItemId, array $recipients): void
{
    $statement = $pdo->prepare(
        'INSERT INTO order_item_recipients (order_item_id, recipient_name) VALUES (:item, :name)'
    );
    foreach ($recipients as $recipient) {
        $name = trim((string) $recipient);
        if ($name === '' || mb_strlen($name) > 160) {
            jsonError('Each recipient needs a valid name.', 422);
        }
        $statement->execute(['item' => $orderItemId, 'name' => $name]);
    }
}
