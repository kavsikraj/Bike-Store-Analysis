--CREATING INDEXES

CREATE INDEX idx_orders_customers ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orderitems_products ON order_items(product_id);
CREATE INDEX idx_orderitems_order ON order_items(order_id);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_stocks_store_product ON stocks(store_id, product_id);

--LOADING DATA FROM CSV

COPY brands(brand_id, brand_name) 
FROM 'D:\SQL Project\Bike Store Analysis\datasets\brands.csv'
CSV HEADER;

COPY categories(category_id, category_name)
FROM 'D:/SQL Project/Bike Store Analysis/datasets/categories.csv'
CSV HEADER;

COPY stores(store_id, store_name, phone, email, street, city, state, zip_code) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/stores.csv' 
CSV HEADER;

COPY staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/staffs.csv' 
WITH CSV HEADER NULL 'NULL';

COPY customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/customers.csv' 
CSV HEADER;

COPY products(product_id, product_name, brand_id, category_id, model_year, list_price) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/products.csv' 
CSV HEADER;

COPY orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/orders.csv' 
WITH CSV HEADER NULL 'NULL';

COPY order_items(order_id, item_id, product_id, quantity, list_price, discount) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/order_items.csv' 
CSV HEADER;

COPY stocks(store_id, product_id, quantity) 
FROM 'D:/SQL Project/Bike Store Analysis/datasets/stocks.csv'
CSV HEADER;


--QUICK VERIFY

SELECT * FROM staffs;
SELECT * FROM brands;
SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM staffs;
SELECT * FROM stocks;
SELECT * FROM stores;
