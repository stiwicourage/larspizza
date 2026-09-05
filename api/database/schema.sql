CREATE TABLE locations (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(80) NOT NULL UNIQUE,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(255) NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ingredients (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(120) NOT NULL UNIQUE,
    name VARCHAR(120) NOT NULL,
    default_unit VARCHAR(30) NULL,
    default_quantity DECIMAL(10, 3) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE menu_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    menu_number SMALLINT UNSIGNED NOT NULL UNIQUE,
    slug VARCHAR(120) NOT NULL UNIQUE,
    name VARCHAR(160) NOT NULL,
    description TEXT NULL,
    price_cents INT UNSIGNED NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE location_menu_overrides (
    location_id BIGINT UNSIGNED NOT NULL,
    menu_item_id BIGINT UNSIGNED NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (location_id, menu_item_id),
    CONSTRAINT fk_location_menu_location
        FOREIGN KEY (location_id) REFERENCES locations (id),
    CONSTRAINT fk_location_menu_item
        FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);

CREATE TABLE menu_item_ingredients (
    menu_item_id BIGINT UNSIGNED NOT NULL,
    ingredient_id BIGINT UNSIGNED NOT NULL,
    quantity DECIMAL(10, 3) NULL,
    unit VARCHAR(30) NULL,
    sort_order SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (menu_item_id, ingredient_id),
    CONSTRAINT fk_menu_item_ingredient_item
        FOREIGN KEY (menu_item_id) REFERENCES menu_items (id),
    CONSTRAINT fk_menu_item_ingredient_ingredient
        FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);

CREATE TABLE orders (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    location_id BIGINT UNSIGNED NOT NULL,
    order_date DATE NOT NULL,
    customer_name VARCHAR(160) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'received',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_location
        FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE order_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    menu_item_id BIGINT UNSIGNED NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT chk_order_item_quantity CHECK (quantity > 0),
    CONSTRAINT fk_order_item_order
        FOREIGN KEY (order_id) REFERENCES orders (id),
    CONSTRAINT fk_order_item_menu_item
        FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);

CREATE TABLE order_item_recipients (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_item_id BIGINT UNSIGNED NOT NULL,
    recipient_name VARCHAR(160) NOT NULL,
    CONSTRAINT fk_recipient_order_item
        FOREIGN KEY (order_item_id) REFERENCES order_items (id)
);
