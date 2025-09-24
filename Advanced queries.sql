
--Total discounts given per month (last 6 months)

WITH monthly_discount AS(
SELECT
    DATE_TRUNC('month',o.order_date)::date AS month,
    ROUND(SUM(oi.quantity * oi.list_price * (COALESCE(oi.discount,0)/100.0)),2) AS total_discount_amount
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE COALESCE(oi.discount,0) > 0
AND o.order_date >= (
    SELECT DATE_TRUNC('month', MAX(order_date)) - INTERVAL '5 months'
    FROM orders
)
GROUP BY DATE_TRUNC('month',o.order_date)
)
SELECT * 
FROM monthly_discount
ORDER BY month;

--Recent 10 orders with customer name and total value

WITH recent_orders AS (
SELECT
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name AS customer_name,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - COALESCE(oi.discount,0)/100.0 )),2) AS order_total
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, customer_name
)
SELECT
    *
FROM recent_orders
ORDER BY order_date DESC
LIMIT 10;
