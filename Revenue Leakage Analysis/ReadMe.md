# Revenue Leakage Analysis

#### SQL | Data Analysis | Payment Reconciliation | MySQL

![SQL](https://img.shields.io/badge/SQL-Querying-blue?logo=mysql)
![Data%20Analysis](https://img.shields.io/badge/Data%20Analysis-Insights-green?logo=googleanalytics)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql)

## Project Overview

This project presents a **SQL-based Revenue Leakage Analysis** built to identify gaps between expected and actual revenue across sales orders and payment transactions. Using joins, aggregations, and conditional logic in MySQL, the analysis uncovers where revenue is being lost, which regions and payment channels are most affected, and how settlement delays impact overall collection performance.

---

## Business Problem

Businesses processing high volumes of orders and payments often struggle to detect where expected revenue fails to convert into actual cash collected. Without a structured way to compare what was billed against what was received, leakage from failed payments, partial settlements, and delayed reconciliations can go unnoticed until it materially affects profitability.

This project uses SQL to join order and payment data, quantify the size and source of revenue leakage, and surface which orders, regions, and sales reps carry the highest risk — enabling faster, more targeted follow-up.

---

## Key Business Questions & Queries

### 1. Total Expected Revenue
Calculates total revenue expected across all sales orders, forming the baseline for leakage comparison.

### 2. Total Actual Revenue
Sums actual amounts received across all payment transactions.

### 3. Revenue Leakage
Joins orders and payments to calculate the total gap between expected and received revenue.

```sql
select
sum(s.expected_net - p.amount_received) as Revenue_leakage
from sales_orders s
join payment_logs p
on s.Order_ID = p.Order_ID;
```

### 4. Monthly Revenue Trend
Tracks expected revenue month-by-month to reveal growth patterns and seasonality.

### 5. Revenue by Region
Breaks down expected revenue across regions to identify top-performing markets.

### 6. Top Performing Sales Rep
Ranks sales reps by total revenue generated, identifying the strongest performer.

### 7. Top Customers
Ranks customers by total expected spend to highlight the most valuable accounts.

### 8. Payment Success Rate
Calculates the percentage breakdown of payment outcomes — Failed, Partial, and Successful.

```sql
select
payment_status,
round(count(*) * 100/(select count(*) from payment_logs),2) as Percentage
from payment_logs
group by payment_status;
```

### 9. Payment Method Analysis
Compares total revenue generated across different payment channels (Card, Mobile Banking, POS, Bank Transfer, USSD).

### 10. Settlement Delay Analysis
Counts transactions by settlement status (Delayed vs Settled) to measure how widespread settlement bottlenecks are.

### 11. Leakage by Orders
Joins orders and payments to identify individual orders with the highest leakage, isolating both fully unpaid and partially paid transactions.

### 12. Tracking Zero-Amount Transactions
Uses a left join to surface transactions where zero amount was received, cross-referenced against order status (Pending, Completed, Cancelled).

---

## Key Insights

- Out of ₦13,114,364.10 in expected revenue, only ₦8,608,704.80 was actually received — a leakage of ₦4,386,197.05, roughly 33% of expected revenue.
- Payment outcomes are nearly evenly split across Failed (32.94%), Partial (34.13%), and Successful (32.94%) — pointing to a systemic issue in the payment process rather than isolated failures.
- Nearly 60% of transactions are delayed rather than settled on time, indicating a bottleneck affecting the majority of transactions.
- Some orders show 100% leakage (zero amount received despite a full expected value), while others show smaller consistent shortfalls — suggesting two distinct problems requiring different interventions.
- Zero-amount transactions appear even on Completed orders, not just Cancelled ones — a data integrity or collection process flag worth investigating directly.
- Tunde Adebayo is the top-performing sales rep by revenue generated, making them a strong candidate to study for best practices across the team.

---

## Skills Demonstrated

- Table joins (`JOIN`, `LEFT JOIN`) across orders and payment data
- Aggregate functions: `SUM()`, `COUNT()`, `GROUP BY`
- Conditional percentage calculations
- Data quality investigation (zero-amount transaction tracking)
- Business-focused query design centered on real financial reconciliation questions

---

## Dataset

The analysis uses two related tables:

**sales_orders**
- Order ID, Sales Rep, Region, Customer ID
- Expected Net Revenue
- Order Status

**payment_logs**
- Transaction ID, Order ID
- Amount Received
- Payment Status (Failed, Partial, Successful)
- Payment Method
- Settlement Status (Delayed, Settled)

> **Note:** This project uses a synthetic dataset created solely for educational and portfolio purposes.


