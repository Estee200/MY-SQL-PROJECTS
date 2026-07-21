# Superstore Sales & Profitability Analysis

![SQL](https://img.shields.io/badge/SQL-Querying-blue?logo=mysql)
![Data%20Cleaning](https://img.shields.io/badge/Data%20Cleaning-Transformation-orange?logo=databricks)
![Business%20Analytics](https://img.shields.io/badge/Business%20Analytics-Insights-green?logo=googleanalytics)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql)

## Project Overview

This project presents a comprehensive **SQL-based analysis** of a retail superstore's sales performance, covering revenue trends, product and category profitability, customer segmentation, and growth patterns over time. The analysis was built entirely in MySQL, from raw data cleaning through advanced window-function queries, to answer real business questions a retail operations or finance team would ask.

---

## Business Problem

Retail businesses generate large volumes of transactional data, but without structured analysis, it's difficult to answer fundamental questions: Which products and categories actually drive profit? Are sales growing month over month? Which customers are most valuable? Which regions underperform?

This project uses SQL to transform raw superstore transaction data into clear, decision-ready answers to these questions — the kind of analysis a business intelligence or finance analyst would deliver to guide inventory, marketing, and customer retention strategy.

---

## Data Cleaning & Preparation

Before analysis, the raw dataset required structural cleanup:

- Renamed inconsistent column headers (e.g., `ORDER DATE` → `Order_Date`, `Ship Mode` → `Ship_Mode`) for consistency and easier querying
- Converted `Order_Date` and `Ship_Date` from text strings into proper SQL `DATE` format using `STR_TO_DATE()`
- Disabled safe update mode temporarily to allow bulk column updates

```sql
alter table superstore rename column `Product Name` to Product_Name;
update superstore
set Order_Date = str_to_date(Order_Date, '%m/%d/%Y');
```

---

## Key Business Questions & Queries

### 1. Total Revenue
Overall revenue generated across all transactions.

### 2. Top 5 Revenue-Generating Products
Identifies which individual products contribute the most to total sales.

### 3. Sales by Segment
Breaks down revenue by customer segment (Consumer, Corporate, Home Office) to understand which segment drives the most business.

### 4. Top 5 Regions by Sales
Ranks regions by total revenue to highlight geographic performance.

### 5. Monthly Sales Trend
Tracks revenue month-by-month to reveal seasonality and growth patterns.

### 6. Sales by Quarter
Aggregates revenue by year and quarter for higher-level trend reporting.

### 7. Category Performance
Compares total revenue across product categories.

### 8–9. Running Total of Monthly Sales (CTE & Window Function)
Calculates a cumulative revenue total month-over-month using `SUM() OVER()`, useful for tracking progress toward annual targets.

```sql
concat('#', format(sum(Monthly_Sales) over (order by Year, Month), 2)) AS Running_Total
```

### 10. Month-over-Month Growth Rate
Uses `LAG()` to compare each month's sales to the previous month, calculating percentage growth and classifying each month as Grow, Decline, or No Change.

### 11. Top 3 Products per Category
Uses `RANK() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC)` to identify each category's best-performing products.

### 12. Customer Segmentation by Value
Classifies customers into High, Medium, and Low value tiers based on total spend, supporting targeted retention strategy.

### 13. Profitability by Category
Compares revenue, profit, and profit margin percentage across categories — identifying which categories are high-revenue but low-margin.

### 14. Customer Loyalty (Order Frequency)
Counts distinct orders per customer to identify the most frequent, loyal buyers.

---

## Key Insights

*(Fill in with your actual query results)*

- Total revenue across the dataset: **[insert total]**
- Top-performing product: **[insert product + revenue]**
- Highest-revenue segment: **[insert segment]**
- Best-performing region: **[insert region]**
- Most profitable category vs. least profitable: **[insert finding]**
- Month with strongest growth vs. sharpest decline: **[insert month + %]**
- Share of customers classified as High-value: **[insert %]**

---

## Skills Demonstrated

- Data cleaning: column renaming, date type conversion, safe update handling
- Aggregate functions: `SUM()`, `COUNT()`, `GROUP BY`
- Window functions: `RANK()`, `LAG()`, `SUM() OVER()`
- Common Table Expressions (CTEs)
- Conditional logic with `CASE WHEN`
- String formatting with `CONCAT()` and `FORMAT()`
- Time-based analysis using `DATE_FORMAT()`, `YEAR()`, `MONTH()`, `QUARTER()`

---

## Tools & Technologies

- MySQL
- SQL (Window Functions, CTEs, Aggregations)

---

## Dataset

The analysis uses the **Superstore dataset**, a widely-used retail transactions dataset containing:

- Order ID, Order Date, Ship Date, Ship Mode
- Customer Name and Segment
- Product Name, Category
- Region
- Sales and Profit figures

> **Note:** This project uses a publicly available sample dataset for educational and portfolio purposes.
