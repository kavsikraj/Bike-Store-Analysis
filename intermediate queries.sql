-- SHOW EACH ORDER WITH CUSTOMER NAME AND ORDER DATE

SELECT
    c.first_name || '' || c.last_name AS customer_name,
    o.order_date,
    o.order_status
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
ORDER BY order_date DESC;

--SHOW EACH ORDER ITEM WITH PRODUCT DETAILS

SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.list_price,
    oi.discount,
    (oi.quantity*oi.list_price * (1-oi.discount)) AS total_cost
FROM order_items oi
LEFT JOIN products p
ON p.product_id = oi.product_id
ORDER BY oi.order_id;

-- FIND THE TOP 5 CUSTOMERS BY TOTAL PURCHASE AMOUNT

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    ROUND(SUM((oi.quantity * oi.list_price) * (1 - oi.discount)),2) AS total_purchase_amount 
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
LEFT JOIN order_items oi
ON oi.order_id = o.order_id
GROUP BY c.customer_id, customer_name
ORDER BY total_purchase_amount DESC
LIMIT 5;

--FIND SALES REVENUE PER STORE

SELECT
    s.store_name,
    ROUND(SUM((oi.list_price * oi.quantity) * (1-oi.discount)),2) AS store_revenue
FROM orders o
LEFT JOIN stores s
ON s.store_id = o.store_id
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY S.store_name
ORDER BY store_revenue DESC;

-- SHOW WHICH STAFF HANDLED THE MOST ORDERS

SELECT
    s.first_name || ' ' || s.last_name AS staff_name,
    COUNT(o.order_id) AS total_orders
FROM staffs s
LEFT JOIN orders o
ON o.staff_id = s.staff_id
GROUP BY staff_name
ORDER BY total_orders DESC
LIMIT 5;

--
