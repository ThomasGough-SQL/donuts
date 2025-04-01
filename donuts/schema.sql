-- Ingredients table (one row per ingredient)
CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price_per_unit REAL NOT NULL
);

-- Donuts table
CREATE TABLE donuts (
    id INTEGER PRIMARY KEY,
    donut_name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);

-- Donut ingredients (join table: many-to-many)
CREATE TABLE donut_ingredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

-- Customers table
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    history TEXT
);

-- Orders table
CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    order_time TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);
