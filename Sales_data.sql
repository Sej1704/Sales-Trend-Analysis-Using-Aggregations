create database online_sales;

use online_sales;

# Inspect The Data

Select * from sales_data limit 10;

Describe sales_data;

ALTER TABLE sales_data
MODIFY COLUMN Date DATE;

Describe sales_data;


SELECT * FROM sales_data LIMIT 10;


# check for nulls
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS missing_orderid,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS missing_customerid,
    SUM(CASE WHEN Product IS NULL THEN 1 ELSE 0 END) AS missing_product,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS missing_unitprice,
    SUM(CASE WHEN TotalPrice IS NULL THEN 1 ELSE 0 END) AS missing_totalprice
FROM sales_data;

SELECT 
    COUNT(*) AS total_records,
    COUNT(DISTINCT OrderID) AS unique_orders,
    MIN(Date) AS first_order,
    MAX(Date) AS last_order,
    SUM(TotalPrice) AS total_revenue
FROM sales_data;

# Show the month extracted from each order date to understand how month extraction works.
SELECT 
    orderId,
    Date,
    EXTRACT(MONTH FROM Date) AS order_month
FROM sales_data
LIMIT 10;

#Group sales data by year and month.

SELECT 
    EXTRACT(YEAR FROM Date) AS order_year,
    EXTRACT(MONTH FROM Date) AS order_month,
    COUNT(*) AS total_orders
FROM sales_data
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


# Find total monthly revenue.

SELECT 
    EXTRACT(YEAR FROM Date) AS order_year,
    EXTRACT(MONTH FROM date) AS order_month,
    SUM(TotalPrice) AS total_revenue
FROM sales_data
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


#Find total number of unique orders each month.
SELECT 
    EXTRACT(YEAR FROM DATE) AS order_year,
    EXTRACT(MONTH FROM DATE) AS order_month,
    COUNT(DISTINCT orderId) AS total_orders
FROM Sales_DATA
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

# Sort the results from highest to lowest monthly revenue.

SELECT 
    EXTRACT(YEAR FROM Date) AS order_year,
    EXTRACT(MONTH FROM Date) AS order_month,
    SUM(totalPrice) AS total_revenue
FROM sales_Data
GROUP BY order_year, order_month
ORDER BY total_revenue DESC;

#Show sales data only for 2024.

SELECT 
    EXTRACT(MONTH FROM date) AS order_month,
    SUM(totalPrice) AS total_revenue,
    COUNT(DISTINCT orderId) AS total_orders
FROM sales_Data
WHERE EXTRACT(YEAR FROM date) = 2024
GROUP BY order_month
ORDER BY order_month;



SELECT 
    EXTRACT(YEAR FROM Date) AS order_year,
    EXTRACT(MONTH FROM Date) AS order_month,
    COUNT(DISTINCT orderId) AS total_orders,
    SUM(TotalPrice) AS total_revenue
FROM sales_Data
WHERE EXTRACT(YEAR FROM Date) BETWEEN 2023 AND 2024
GROUP BY order_year, order_month
ORDER BY order_year, order_month;












