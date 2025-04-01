# 🍩 Donuts Database (SQLite)

A relational database schema for managing a donut shop, its ingredients, customers, and orders. Designed for learning, testing, and small business simulations.

---

## 📦 Schema Overview

The database includes the following normalized tables:

### `ingredients`
Stores individual ingredients used in donuts.
- `id`: Primary key
- `name`: Name of the ingredient
- `gluten_free`: Boolean (0 = No, 1 = Yes)
- `price_per_unit`: Cost of ingredient

### `donuts`
Stores donut types sold in the shop.
- `id`: Primary key
- `donut_name`: Name of the donut
- `gluten_free`: Boolean (0 = No, 1 = Yes)
- `price`: Retail price of the donut

### `donut_ingredients`
Join table connecting donuts and the ingredients they use.
- `donut_id`: References `donuts(id)`
- `ingredient_id`: References `ingredients(id)`

### `customers`
Tracks customers and any purchase history notes.
- `id`: Primary key
- `first_name`, `last_name`: Customer name
- `history`: Optional field (e.g. past purchases or preferences)

### `orders`
Tracks individual donut purchases.
- `id`: Primary key
- `customer_id`: References `customers(id)`
- `donut_id`: References `donuts(id)`
- `quantity`: Number of donuts purchased
- `order_time`: Timestamp of order

---

## 🧪 Example Query

**List all gluten-free donuts and their ingredients:**
```sql
SELECT d.donut_name, i.name AS ingredient
FROM donuts d
JOIN donut_ingredients di ON d.id = di.donut_id
JOIN ingredients i ON di.ingredient_id = i.id
WHERE d.gluten_free = 1;
