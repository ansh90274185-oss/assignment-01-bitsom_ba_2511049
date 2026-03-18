## ETL Decisions

### Decision 1 — Date Format Standardization
**Problem:** The raw `retail_transactions.csv` contained dates in multiple formats (e.g., '29/08/2023', '12-12-2023', and '2023-02-05'). This inconsistency makes it impossible to perform time-series analysis or use built-in SQL date functions effectively.
**Resolution:** I implemented a transformation rule to parse all incoming date strings and convert them into a uniform `YYYY-MM-DD` ISO format before loading them into the `dim_date` and `fact_sales` tables.

### Decision 2 — Categorical Consolidation and Casing
**Problem:** The 'category' field suffered from inconsistent casing (e.g., 'electronics' vs 'Electronics') and minor naming variations (e.g., 'Grocery' vs 'Groceries'). In a data warehouse, these would be treated as distinct entities, leading to fragmented and incorrect reports.
**Resolution:** I applied a standardization step to capitalize the first letter of each category and mapped all variations of groceries to a single value ('Groceries'). This ensures that all products in the same category are grouped correctly in Q1.

### Decision 3 — Null Value Imputation for Store City
**Problem:** Several records in the `store_city` column were NULL. For a retail chain, missing location data hinders geographic business intelligence and regional performance reporting.
**Resolution:** Since the `store_name` (e.g., 'Chennai Anna') was consistent, I used a mapping strategy to fill in the missing `store_city` values based on the store's known location. This allowed the `dim_store` dimension to be fully populated without losing valuable transactional data.
