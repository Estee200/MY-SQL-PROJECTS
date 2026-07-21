# Results & Insights

This document walks through the key SQL queries used in the Revenue Leakage Analysis project, along with the business insight each one uncovers.

---

## 1. Total Expected Revenue
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Total%20Expected%20Revenue.png?raw=true" width="800">

**Insight:** Total expected revenue across all sales orders is ₦13,114,364.10 — this forms the baseline against which actual collections and leakage are measured.

---

## 2. Total Actual Revenue
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Total%20Actual%20Revenue.png?raw=true" width="800">

**Insight:** Only ₦8,608,704.80 was actually received against the ₦13.1M expected — meaning roughly a third of anticipated revenue never made it into the business, a gap significant enough to warrant deeper investigation into collection processes.

---

## 3. Revenue Leakage
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Revenue%20Leakage.png?raw=true" width="800">

**Insight:** Total revenue leakage stands at ₦4,386,197.05, representing about 33% of expected revenue — a leakage rate this high signals a systemic collection issue rather than a handful of isolated payment failures.

---

## 4. Monthly Revenue Trend
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Monthly%20Revenue%20Trend.png?raw=true" width="800">

**Insight:** Revenue grew steadily from ₦604,480.55 in May 2025 to over ₦1.13M by December 2025 — a near-doubling in monthly revenue that suggests the business is scaling, making it even more important to close the leakage gap before it grows proportionally.

---

## 5. Revenue by Region
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Revenue%20by%20Region.png?raw=true" width="800">

**Insight:** Lagos leads all regions with ₦1,432,560.45 in revenue, followed closely by Kaduna and Ibadan — revenue is fairly evenly distributed across the top 8 regions rather than concentrated in one dominant location.

---

## 6. Top Performing Sales Rep
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Top%20Performing%20Rep.png?raw=true" width="800">

**Insight:** Tunde Adebayo leads all sales reps with ₦2.79M in revenue generated, making them a strong candidate to study for best practices to replicate across the team.

---

## 7. Top Customers
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Top%20Customers.png?raw=true" width="800">

**Insight:** The top customer (CUST-292) contributes ₦45,789.15, with the next several customers clustered closely between ₦33K–₦40K — spending is fairly spread across top customers rather than being dominated by one, reducing dependency risk.

---

## 8. Payment Success Rate
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Payment%20Success%20Rate.png?raw=true" width="800">

**Insight:** Payments are nearly evenly split across Failed (32.94%), Partial (34.13%), and Successful (32.94%) — meaning over two-thirds of transactions aren't completing cleanly, pointing to a systemic issue in the payment process rather than isolated failures.

---

## 9. Payment Method Analysis
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Payment%20Method%20Analysis.png?raw=true" width="800">

**Insight:** Card Payment generates the most revenue (₦1.78M), while USSD trails at ₦1.62M — the relatively even spread across all 5 channels suggests no single payment method is being neglected, though Card Payment's lead makes it the highest priority to keep reliable.

---

## 10. Settlement Delay
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Settlement%20Delay.png?raw=true" width="800">

**Insight:** Nearly 60% of transactions (2,969 out of 4,955) are delayed rather than settled on time — with delayed settlements outnumbering on-time ones, this points to a bottleneck in the settlement process that's affecting the majority of transactions, not the exception.

---

## 11. Leakage by Orders
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Leakage%20by%20Orders.png?raw=true" width="800">

**Insight:** Several orders (e.g. ORD-1001, ORD-1003, ORD-1010) show 100% leakage — zero amount received despite a full expected value — while others show partial leakage of ₦50–₦150, suggesting two distinct problems: fully unpaid orders and small consistent shortfalls, each likely needing a different fix.

---

## 12. Tracking Zero-Amount Transactions
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Revenue%20Leakage%20Analysis/Revenue%20Leakage%20Result%20Images/Tracking%20some%20zero%20amt.png?raw=true" width="800">

**Insight:** Zero-amount transactions appear across all order statuses — Pending, Completed, and Cancelled — meaning "zero received" isn't isolated to cancelled orders alone; some Completed orders show zero payment recorded, which is a data integrity or collection process flag worth investigating directly.

---
