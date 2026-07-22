# Legal Financial Insight & Data Quality Analysis

#### SQL | Data Cleaning | Data Quality Assessment | MySQL

![SQL](https://img.shields.io/badge/SQL-Querying-blue?logo=mysql)
![Data%20Cleaning](https://img.shields.io/badge/Data%20Cleaning-Transformation-orange?logo=databricks)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql)

## Project Overview

This project presents a **SQL-based data quality assessment and cleaning workflow** for a law firm's billing and financial dataset, followed by the calculation of key financial performance metrics. Before any analysis could be trusted, the raw legal billing data required a thorough audit — checking for duplicates, missing values, invalid dates, and negative financial figures — to ensure the resulting metrics on revenue, collections, and write-offs were built on reliable data.

---

## Business Problem

Law firms manage complex billing data across multiple attorneys, practice areas, and clients — but raw billing exports are rarely analysis-ready. Missing values, duplicate invoices, invalid dates, and negative amounts can silently distort revenue reporting and collection rate calculations if left unaddressed.

This project establishes a structured, repeatable process to audit data quality first, clean the dataset systematically, and only then calculate business-critical metrics like revenue gap, collection rate, and write-off rate — ensuring financial reporting for the firm is built on trustworthy data.

---

## Dataset Preview

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Dataset%20Preview.png?raw=true" width="800">

The raw dataset contains **4,738 records**, with fields covering invoice details, client and attorney information, billing figures, and settlement timelines.

---

## Data Quality Assessment

Before cleaning, the raw dataset was audited across several dimensions:

### 1. Total Records
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Total%20Records.png?raw=true" width="800">

```sql
select count(*)
from legal_data;
```

### 2. Duplicate Check
Grouped by `Invoice_ID` to flag any invoice appearing more than once.

```sql
select Invoice_ID, count(*)
from legal_data
group by Invoice_ID
having count(*) > 1;
```

### 4. Invalid Dates
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Checking%20Invalid%20Dates.png?raw=true" width="800">

```sql
select *
from legal_data where Date_Logged = '0000-00-00';
```

### 5. Missing Values Audit
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Checking%20Missing%20Data.png?raw=true" width="800">

A comprehensive column-by-column check across all 22 fields using conditional `SUM(CASE WHEN...)` logic.

```sql
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Invoice_ID IS NULL OR Invoice_ID = '' THEN 1 ELSE 0 END) AS missing_Invoice_ID,
    ...
FROM legal_data;
```

### Total Revenue
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Total%20Revenue.png?raw=true" width="800">


```sql
select 
sum(amount_collected)
from legal_data_metrics;
```

---

## Key Insights

- The raw dataset contains **4,738 records**, providing a substantial base for financial analysis once cleaned.
- Total revenue collected across all invoices is **₦54,257,049,281.25**.
- Only 4 out of 22+ fields had missing data (Payment_Date, Days_to_Settle, Region, Client_Industry) — indicating the raw dataset was largely complete, with issues concentrated in specific areas rather than widespread.
- No negative billable amounts were found in the raw dataset — a positive sign of upstream data entry discipline, though the cleaning process still included a safeguard to remove any that might appear.
- Several records had invalid `Date_Logged` values stored as `'0000-00-00'`, standardized during cleaning to avoid breaking downstream date-based calculations.
- Derived business metrics (Revenue Gap, Collection Rate, Write-Off Rate, Revenue per Hour) were successfully calculated, forming the foundation for future attorney and practice-area performance analysis.

---

## Skills Demonstrated

- Data quality auditing (missing values, duplicates, invalid dates, negative values)
- Data cleaning and standardization (`TRIM()`, conditional updates, safe update handling)
- Window functions (`ROW_NUMBER()` for duplicate removal)
- Conditional business logic (`CASE WHEN`) for derived financial metrics
- Date functions (`YEAR()`, `MONTH()`, `MONTHNAME()`, `QUARTER()`)
- Building analysis-ready datasets from raw, unvalidated data

---

## Dataset

The analysis uses a **law firm billing dataset** containing:

- Invoice ID, Date Logged, Invoice Due Date, Payment Date
- Client Name, Client Industry, Region
- Handling Attorney, Attorney Level, Practice Area, Matter Complexity
- Billing Type, Invoice Status
- Hours Logged, Hourly Rate, Billable Amount
- Discount Given, Tax Amount, Net Revenue
- Amount Collected, Write-Offs, Outstanding Balance
- Days to Settle, Invoice Aging Bucket

> **Note:** This project uses a synthetic dataset created solely for educational and portfolio purposes.

---

📄 **[View Full Results & Findings →](Results.md)**
