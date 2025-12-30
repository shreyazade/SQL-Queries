-- 1. Rank users by total spending
SELECT user_id,
       SUM(total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS spending_rank
FROM orders
GROUP BY user_id;

-- 2. Running total of orders per day
SELECT order_date,
       total_amount,
       SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- 3. Find duplicate payments
SELECT payment_id, order_id,
       COUNT(*) OVER (PARTITION BY order_id) AS duplicate_count
FROM payments;
