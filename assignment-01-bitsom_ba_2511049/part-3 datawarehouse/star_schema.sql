-- 1. Create Dimension Tables
CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    quarter INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- 2. Create central Fact Table
CREATE TABLE fact_sales (
    sale_id VARCHAR(20) PRIMARY KEY,
    date_key DATE REFERENCES dim_date(date_key),
    store_id INT REFERENCES dim_store(store_id),
    product_id INT REFERENCES dim_product(product_id),
    units_sold INT,
    total_revenue DECIMAL(15, 2)
);

-- 3. INSERT cleaned and standardized Dimension data
INSERT INTO dim_store (store_id, store_name, store_city) VALUES 
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

-- Standardized Category Casing (e.g., 'Electronics', 'Groceries')
INSERT INTO dim_product (product_id, product_name, category) VALUES 
(100, 'Speaker', 'Electronics'),
(101, 'Tablet', 'Electronics'),
(102, 'Phone', 'Electronics'),
(103, 'Smartwatch', 'Electronics'),
(104, 'Atta 10kg', 'Groceries');

-- Standardized Date formats (YYYY-MM-DD)
INSERT INTO dim_date (date_key, day, month, year, quarter) VALUES 
('2023-01-15', 15, 1, 2023, 1),
('2023-01-20', 20, 1, 2023, 1),
('2023-02-05', 5, 2, 2023, 1),
('2023-08-09', 9, 8, 2023, 3),
('2023-08-29', 29, 8, 2023, 3),
('2023-12-12', 12, 12, 2023, 4);

-- 4. INSERT 10 cleaned Fact rows (Corrected Dates & Calculated Revenue)
INSERT INTO fact_sales (sale_id, date_key, store_id, product_id, units_sold, total_revenue) VALUES 
('TXN5000', '2023-08-29', 1, 100, 3, 147788.34),
('TXN5001', '2023-12-12', 1, 101, 11, 255487.32),
('TXN5002', '2023-02-05', 1, 102, 20, 974067.80),
('TXN5003', '2023-02-20', 2, 101, 14, 325165.68),
('TXN5004', '2023-01-15', 1, 103, 10, 588510.10),
('TXN5005', '2023-08-09', 3, 104, 12, 629568.00),
('TXN5006', '2023-01-15', 2, 100, 5, 246313.90),
('TXN5007', '2023-02-05', 3, 101, 2, 46452.24),
('TXN5008', '2023-08-29', 2, 104, 8, 419712.00),
('TXN5009', '2023-12-12', 3, 102, 1, 48703.39);