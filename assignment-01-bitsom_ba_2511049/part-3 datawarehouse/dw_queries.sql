-- Q1: Total sales revenue by product category for each month
-- Purpose: Analyzing which categories perform best over time.
SELECT 
    d.month, 
    p.category, 
    SUM(f.total_revenue) AS total_monthly_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.month, p.category
ORDER BY d.month, total_monthly_revenue DESC;

-- Q2: Top 2 performing stores by total revenue
-- Purpose: Identifying high-value locations for business optimization.
SELECT 
    s.store_name, 
    SUM(f.total_revenue) AS total_store_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_store_revenue DESC
LIMIT 2;

-- Q3: Month-over-month sales trend across all stores
-- Purpose: Tracking growth or decline in overall business performance.
SELECT 
    d.year, 
    d.month, 
    SUM(f.total_revenue) AS monthly_sales_trend
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;