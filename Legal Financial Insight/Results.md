# Results & Data Quality Findings

This document highlights the key SQL queries used to clean, transform, and analyze the legal financial dataset. Each query answers an important business question and provides insights that support financial reporting and decision-making.

---

## 1. Dataset Preview

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Dataset%20Preview.png?raw=true" width="800">

**Insight:** Before any analysis, I explored the raw dataset to understand its structure, data types, and available financial information. This provided a foundation for the subsequent data quality assessment and transformation process.

---

## 2. Total Records

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Total%20Records.png?raw=true" width="800">

**Insight:** The dataset contains over 5,000 legal billing records, providing sufficient transaction history for meaningful financial analysis while also confirming that all expected records were successfully imported.

---

## 3. Checking Missing Data

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Checking%20Missing%20Data.png?raw=true" width="800">

**Insight:** Missing values were identified across a small number of business-critical fields, including Region, Client Industry, Payment Date, and Days to Settle. Identifying these gaps early ensured they could be handled before reporting and analysis.

---

## 4. Checking Invalid Dates

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Checking%20Invalid%20Dates.png?raw=true" width="800">

**Insight:** Invalid placeholder dates were detected within the transaction history. Correcting these values prevented errors in time-based analysis such as monthly trends, settlement tracking, and quarterly reporting.

---

## 5. Checking Negative Financial Values

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Checking%20Negative%20Values.png?raw=true" width="800">

**Insight:** A small number of records contained negative billable amounts, representing invalid financial transactions. Removing these records improved the accuracy of revenue and collection reporting.

---

## 6. Data Transformation

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Transformation.png?raw=true" width="800">

**Insight:** Additional business metrics were created to simplify reporting, including Revenue Gap, Collection Rate, Write-Off Rate, Revenue per Hour, Year, Month, Quarter, and Month Name. These transformations reduced the amount of calculation required in Power BI while creating a more analysis-ready dataset.

---

## 7. Revenue per Hour

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Revenue%20Per%20Hr.png?raw=true" width="800">

**Insight:** Revenue generated per billable hour provides a useful productivity measure, allowing the firm to compare billing efficiency across attorneys and better understand how time is being converted into revenue.

---

## 8. Total Revenue

<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Legal%20Financial%20Insight/Legal%20data%20Result%20Images/Total%20Revenue.png?raw=true" width="800">

**Insight:** Total collected revenue establishes the firm's overall financial performance and serves as the primary benchmark for evaluating collections, attorney productivity, practice area performance, and regional contribution.

---
