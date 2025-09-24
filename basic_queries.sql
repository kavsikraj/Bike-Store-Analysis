-- SHOW ALL THE CUSTOMERS ARE FROM CA

SELECT
    customer_id,
    first_name,
    last_name,
    city,
    state
FROM customers
WHERE state = 'CA';

--LIST THE TOP 5 MOST EXPENSIVE PRODUCTS

SELECT
    product_id,
    product_name,
    list_price
FROM products
ORDER BY list_price DESC
LIMIT 5;


--COUNT HOW MANY ORDERS WHERE PLACED BY EACH ORDER STATUS

SELECT
    order_status,
    COUNT(*)
FROM orders
GROUP BY order_status;

--FIND THE TOTAL QUANTITY OF EACH PRODUCT IN STOCKS

SELECT 
    p.product_name,
    SUM(s.quantity) AS total_stock
FROM stocks s
LEFT JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_stock DESC;

-- COUNT NO.OF.CUSTOMERS IN EACH CITY

SELECT
    COUNT(customer_id) AS total_customers,
    city
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- FIND THE TOTAL REVENUE EARNED FROM EACH PRODUCT

SELECT
    p.product_name,
    SUM(oi.quantity * oi.list_price*(1-oi.discount)) AS total_revenue
FROM order_items oi
LEFT JOIN products p
ON p.product_id = oi.product_id
GROUP BY p.product_name
