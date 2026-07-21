# Results & Insights

This document walks through the key SQL queries used in the Superstore Sales & Profitability Analysis project, along with the business insight each one uncovers.

---

## 1. Total Revenue
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Total%20Revenue.png?raw=true" width="800">

**Insight:** Total revenue across all transactions is $2,272,449.86, providing the baseline figure against which all product, category, and segment-level performance is measured.

---

## 2. Top 5 Revenue by Product
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Top%205%20Revenue%20by%20Product.png?raw=true" width="800">

**Insight:** The top 5 individual products — led by Xerox Blank Computer Paper and Avery Framed View Binder — each contribute roughly $99 in revenue, showing that no single product dominates sales; revenue is spread thinly across a large product catalog rather than concentrated in a few bestsellers.

---

## 3. Sales by Segment
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Sales%20by%20segment.png?raw=true" width="800">

**Insight:** Consumer segment drives the majority of revenue at $1.15M, more than double Corporate ($696.6K) and nearly 3x Home Office ($425.7K) — suggesting marketing and retention efforts should prioritize the Consumer base while exploring why Home Office lags significantly behind.

---

## 4. Monthly Sales Trend
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Monthly%20Sales%20Trend.png?raw=true" width="800">

**Insight:** Monthly revenue is highly volatile early on — dropping from $14,161 in January to just $4,119 in February, then spiking to $81,496 by September — indicating strong seasonality or promotion-driven spikes rather than steady organic growth.

---

## 5. Sales by Quarter
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Sales%20by%20Quarter.png?raw=true" width="800">

**Insight:** Revenue consistently peaks in Q4 each year (e.g., $179K in 2014, $180.6K in 2015), reflecting a strong seasonal pattern likely tied to holiday-season demand — a trend worth aligning inventory and staffing plans around.

---

## 6. Monthly Running Total
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/Monthly%20Running%20Total.png?raw=true" width="800">

**Insight:** Cumulative revenue builds steadily through the year, reaching $221,194.97 by August 2014 alone — this running total view is useful for tracking real-time progress against annual revenue targets.

---

## 7. Month-over-Month Growth
<img src="https://github.com/Estee200/MY-SQL-PROJECTS/blob/main/Super-Store-Sales/Super%20store%20Result%20Images/MoM%20Growth.png?raw=true" width="800">

**Insight:** Growth is extremely volatile in early 2014 — a 70.91% decline in February was followed by a dramatic 1,247.78% surge in March, then two consecutive months of decline — swings this large suggest the
