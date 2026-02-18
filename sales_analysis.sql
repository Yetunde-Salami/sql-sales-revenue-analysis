-- =====================================================
-- SQL Sales & Revenue Analysis Project
-- Author: Yetunde Salami
-- Database: PostgreSQL
-- =====================================================


-- =====================================================
-- 1. SCHEMA DESIGN
-- =====================================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- =====================================================
-- 2. INSERT SAMPLE DATA
-- =====================================================

INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Vanilla Ice Cream', 'Classic'),
(2, 'Chocolate Ice Cream', 'Classic'),
(3, 'Strawberry Ice Cream', 'Fruit'),
(4, 'Lemon Sorbet', 'Fruit'),
(5, 'Caramel Delight', 'Premium');

INSERT INTO sales (order_id, order_date, product_id, quantity, unit_price) VALUES
(101, '2024-01-05', 1, 10, 5.00),
(102, '2024-01-07', 2, 8, 6.00),
(103, '2024-02-10', 3, 15, 5.50),
(104, '2024-02-12', 1, 12, 5.00),
(105, '2024-03-01', 4, 20, 4.50),
(106, '2024-03-03', 5, 5, 7.00),
(107, '2024-03-15', 2, 9, 6.00),
(108, '2024-04-02', 3, 18, 5.50);


-- =====================================================
-- 3. DATA VERIFICATION
-- =====================================================

-- View sales table
SELECT * FROM sales;

-- View products table
SELECT * FROM products;


-- =====================================================
-- 4. TOTAL REVENUE PER PRODUCT
-- =====================================================

SELECT 
    p.product_name,
    SUM(s.quantity * s.unit_price) AS total_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- =====================================================
-- 5. MONTHLY REVENUE ANALYSIS
-- =====================================================

SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;


-- =====================================================
-- 6. TOP 5 PRODUCTS BY REVENUE
-- =====================================================

SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.quantity * s.unit_price) AS total_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
