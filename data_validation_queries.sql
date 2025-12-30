-- 1. Orders without corresponding payments (data mismatch)
SELECT o.order_id
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

-- 2. Orders with incorrect total amount
SELECT o.order_id,
       o.total_amount,
       SUM(oi.quantity * p.price) AS calculated_amount
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.total_amount
HAVING o.total_amount <> calculated_amount;

-- 3. Users with duplicate email IDs
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
