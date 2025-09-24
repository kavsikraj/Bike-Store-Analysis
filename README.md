# Bike-Store-Analysis
End-to-end SQL project on the Bike Store dataset. Covers DDL (tables, indexes), data import from CSV, and analysis queries (customers, products, sales, staff, discounts) with CTEs and joins in PostgreSQL.
# Bike Store SQL Project

## 📌 Overview

This project analyzes the **Bike Store** dataset using SQL on PostgreSQL. It covers the full workflow — from database schema creation and indexing, to data loading from CSV files, and finally analytical queries (basic ➝ advanced). The goal is to demonstrate query writing skills with **joins, aggregations, and CTEs**.

---

## 📂 Project Structure

```
bike-store-sql-project/
│
├── schema.sql              # DDL commands (tables + indexes)
├── load_data.sql           # COPY commands to load CSV data
├── analysis_queries.sql    # Queries: basic, intermediate, advanced
└── README.md               # Documentation
```

---

## 🗄️ Database Schema

**Tables:**

* brands
* categories
* customers
* stores
* staffs
* orders
* products
* order\_items
* stocks

**Indexes:** added on `order_date`, `customer_id`, `product_id`, etc. to optimize performance.

---

## 📥 Data Loading

CSV files are imported using PostgreSQL `COPY` command. Example:

```sql
COPY customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
FROM 'D:/SQL Project/Bike Store Analysis/datasets/customers.csv'
CSV HEADER;
```

---

## 📊 Queries

### 🔹 Basic Queries

* Show all customers from California (CA)
* List top 5 most expensive products
* Count orders by order status
* Find total quantity of each product in stocks
* Count number of customers in each city

### 🔹 Intermediate Queries

* Total revenue earned from each product
* Show each order with customer name and order date
* Show each order item with product details
* Top 5 customers by total purchase amount
* Sales revenue per store
* Staff who handled the most orders

### 🔹 Advanced Queries (with CTEs)

1. **Monthly Discounts (last 6 months)**

   * Calculates total discounts given month-wise.
   * Uses `MAX(order_date)` to dynamically get last 6 months.

2. **Recent 10 Orders**

   * Shows 10 most recent orders.
   * Includes customer name and total value (after discounts).
   * Demonstrates JOIN + aggregation with a CTE.

---

## ▶️ How to Run

1. Run `schema.sql` to create tables & indexes.
2. Run `load_data.sql` to load CSV datasets.
3. Run `analysis_queries.sql` to execute queries.

Example in **psql**:

```bash
psql -U postgres -d bikestore -f schema.sql
psql -U postgres -d bikestore -f load_data.sql
psql -U postgres -d bikestore -f analysis_queries.sql
```

---

## 🧑‍💻 Author

**Kowshik**
SQL Analyst | Data Enthusiast
