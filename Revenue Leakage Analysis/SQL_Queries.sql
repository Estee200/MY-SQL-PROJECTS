SELECT * FROM payment_logs;

								--- DATA CLEANING
--- check duplicates
SELECT ORDER_ID, COUNT(*)
FROM sales_orders
group by Order_ID
HAVING COUNT(*)>1;

SELECT TRANSACTION_ID, COUNT(*)
FROM payment_logs
group by Transaction_ID
HAVING COUNT(*)>1;

SET SQL_SAFE_UPDATES = 0;

with Clean as(
select transaction_id,
		row_number() over(partition by transaction_id order by transaction_id) as row_num
	from payment_logs
)
Delete from payment_logs
where Transaction_ID IN (
	SELECT TRANSACTION_ID
	FROM clean
	where row_num >1);
    
set sql_safe_updates = 1;

select * from sales_orders;
--- Tracking some zero amount payment with the sales table for audit purpose
SELECT 
p.transaction_id, 
p.amount_received, 
p.order_id,
s.order_id,
s.expected_net,
s.order_status,
p.payment_status
from payment_logs p
left join sales_orders s
on p.order_id = s.order_id
where p.amount_received = 0;

--- checking missing values
SELECT *
FROM payment_logs
WHERE Amount_Received IS null 
OR trim(amount_received) = '';

SELECT *
FROM sales_orders
WHERE Customer_ID IS null OR trim(customer_id) = ''
or expected_net is null 
or gross_amount is null 
or order_status is null or trim(order_status) = '';

--- fix incorrect finacial values
select *
from sales_orders
where Expected_Net <> (Gross_Amount-Discount_Applied);

--- check payment without matching sales
select p.*
from payment_logs p
LEFT JOIN sales_orders s
on p.Order_ID = s.Order_ID
where s.Order_ID is null;

								--- CORE BUSINESS ANALYSIS

select * from payment_logs;

--- Total Expected Revenue
SELECT 
CONCAT('#', FORMAT(SUM(EXPECTED_NET), 2)) AS Total_Expected_Revenue
FROM sales_orders;

--- Total Actual Revenue
SELECT 
CONCAT('#', FORMAT(SUM(amount_received), 2)) AS Total_Actual_amount
FROM payment_logs;

--- Revenue_Leakage
select 
sum(s.expected_net - p.amount_received) as Revenue_leakage
from sales_orders s
join payment_logs p
on s.Order_ID = p.Order_ID;

--- Leakage by orders
select
s.Order_ID,
s.expected_net,
p.amount_received,
(s.expected_net - p.amount_received) Leakage
from sales_orders s
join payment_logs p
on s.Order_ID = p.Order_ID
where s.expected_net > p.amount_received;

--- Revenue by Region
select 
region,
CONCAT('#', FORMAT(SUM(EXPECTED_NET), 2)) AS revenue
from sales_orders
group by region
order by revenue desc;

--- Payment method analysis
select
concat('#', format(sum(Amount_Received), 2)) as Revenue,
Payment_Method 
from payment_logs
group by Payment_Method
order by REVENUE DESC;

--- settlement delay analysis
select 
Settlement_Status,
count(*) as Total_transaction
from payment_logs
group by settlement_Status;

--- Top customers
select 
Customer_ID,
concat('#', format(sum(Expected_Net), 2))  as Total_Spent
 from sales_orders
 group by Customer_ID
order by sum(Expected_Net) desc;

--- ADVANCED ANALYSIS
--- Monthly Revenue trend
select 
date_format(Order_date, '%Y-%m') as Month,
concat('#', format(sum(Expected_Net), 2)) as Revenue
from sales_orders
group by date_format(Order_date, '%Y-%m')
order by month;

--- Payment success rate
select 
payment_status,
round(count(*) * 100/(select count(*) from payment_logs),2) as Percentage
from payment_logs
group by Payment_Status;

--- Average settlement time insight
select 
round(avg(datediff(Settlement_Date, order_date)), 1) as Avg_settlemet_date
from payment_logs p
join sales_orders s
on p.order_id = s.Order_ID;

--- Avg monthly settlement time
select 
date_format(order_date, '%Y-%m') as Date_dif,
round(avg(datediff(Settlement_Date, order_date)),1) as Avg_settlemet_date
from payment_logs p
join sales_orders s
on p.order_id = s.Order_ID
group by date_format(Order_date, '%Y-%m');

--- Fact table for powerbi report
create view Fact_Table as
SELECT 
    s.Order_ID,
    s.Order_Date,
    s.Customer_ID,
    s.Region,
    s.Product_Category,
    s.Sales_Channel,
    s.Sales_Rep,
    s.Expected_Net,
    s.Gross_amount,
    s.Discount_Applied,
    s.Order_Status,
    p.Transaction_ID,
    p.Amount_Received,
    p.Gateway_Fees,
    p.Payment_Method,
    p.Payment_Status,
    p.Settlement_Status,
    p.Settlement_Date,

    (s.Expected_Net - p.Amount_Received) AS Revenue_Leakage,

    CASE
        WHEN s.Expected_Net = p.Amount_Received
        THEN 'Fully Reconciled'

        WHEN p.Amount_Received = 0
        THEN 'Failed Payment'

        WHEN s.Expected_Net > p.Amount_Received
        THEN 'Partial Payment'

        ELSE 'Check Required'
    END AS Reconciliation_Status

FROM Sales_Orders s
Left JOIN Payment_Logs p
ON s.Order_ID = p.Order_ID;

--- Top performing rep

create view Top_sales_rep as
SELECT 
    Sales_Rep, 
    SUM(Expected_Net) AS Revenue_generated
FROM sales_orders
GROUP BY Sales_Rep
ORDER BY Revenue_generated DESC
LIMIT 1;













