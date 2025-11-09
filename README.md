# Sales-Trend-Analysis-Using-Aggregations


**Objective:**
Analyze monthly revenue and order volume using SQL aggregation functions.

**Steps Followed:**

**1. Data Cleaning**

Checked and verified data types for all columns.

Removed duplicate records and invalid entries.

Handled NULL or missing values using appropriate replacements.

Corrected negative or zero values in quantity and amount.

Standardized text fields like order status and payment method.

**2. Data Analysis Using SQL Queries**

Extracted month and year from the order date.

Grouped data by year and month for trend analysis.

Used SUM() to calculate total monthly revenue.

Used COUNT(DISTINCT order_id) to find monthly order volume.

Sorted results with ORDER BY to show trends over time.

Filtered results for specific years or months when required.


**3. Outcome**

Cleaned and structured dataset.

Monthly summary of total revenue and number of orders.

Ready for further visualization or business insights.
