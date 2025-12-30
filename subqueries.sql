-- 1. Users who placed more than 3 orders
SELECT user_id, name
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM orders
    GROUP BY user_id
    HAVING COUNT(order_id) > 3
);

-- 2. Products never ordered
SELECT product_id, product_name
FROM products
WHERE product_id NOT IN (
    SELECT product_id FROM order_items
);

-- 3. Orders with amount greater than average order value
SELECT order_id, total_amount
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount) FROM orders
);
