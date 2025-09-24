-- DDL COMMANDS

DROP TABLE IF EXISTS brands;
CREATE TABLE brands(
    brand_id INT PRIMARY KEY NOT NULL,
    brand_name TEXT
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name TEXT NOT NULL
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    phone TEXT,
    email TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores(
    store_id INT PRIMARY KEY,
    store_name TEXT,
    phone TEXT,
    email TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT
);

DROP TABLE IF EXISTS staffs;
CREATE TABLE staffs(
    staff_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    active BOOLEAN,
    store_id INT REFERENCES stores(store_id),
    manager_id INT REFERENCES staffs(staff_id)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_status INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT ,
    staff_id INT
);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name TEXT,
    brand_id INT REFERENCES brands(brand_id),
    category_id INT REFERENCES categories(category_id),
    model_year INT,
    list_price NUMERIC(10,2)
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items(
    order_id INT REFERENCES orders(order_id),
    item_id INT,
    product_id INT REFERENCES products(product_id),
    quantity INT,
    list_price NUMERIC(10,2),
    discount NUMERIC(5,2),
    PRIMARY KEY (order_id, item_id)
);

DROP TABLE IF EXISTS stocks;
CREATE TABLE stocks (
  store_id   INTEGER REFERENCES stores(store_id),
  product_id INTEGER REFERENCES products(product_id),
  quantity   INTEGER,
  PRIMARY KEY (store_id,product_id)
);
