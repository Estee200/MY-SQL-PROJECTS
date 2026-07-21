SELECT * FROM legal_data;

--- Total Records
select count(*)
from legal_data;

									--- DATA QUALITY ASSESSMENT
	-- Check Duplicates
select Invoice_ID, count(*)
from legal_data
group by Invoice_ID
having count(*)>1;

	-- Check Negative Financial Values
select Billable_Amount, count(*)
from legal_data
where Billable_Amount <0
group by Billable_Amount;

	-- Check invalid dates
select *
from legal_data where Date_Logged = '0000-00-00';
	
    -- Checking missing values
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Invoice_ID IS NULL OR Invoice_ID = '' THEN 1 ELSE 0 END) AS missing_Invoice_ID,
    SUM(CASE WHEN Date_Logged IS NULL OR Date_Logged = '' THEN 1 ELSE 0 END) AS missing_Date_Logged,
    SUM(CASE WHEN Invoice_Due_Date IS NULL OR Invoice_Due_Date = '' THEN 1 ELSE 0 END) AS missing_Invoice_Due_Date,
    SUM(CASE WHEN Payment_Date IS NULL OR Payment_Date = '' THEN 1 ELSE 0 END) AS missing_Payment_Date,
    SUM(CASE WHEN Region IS NULL OR Region = '' THEN 1 ELSE 0 END) AS missing_Region,
    SUM(CASE WHEN Practice_Area IS NULL OR Practice_Area = '' THEN 1 ELSE 0 END) AS missing_Practice_Area,
    SUM(CASE WHEN Matter_Complexity IS NULL OR Matter_Complexity = '' THEN 1 ELSE 0 END) AS missing_Matter_Complexity,
    SUM(CASE WHEN Client_Name IS NULL OR Client_Name = '' THEN 1 ELSE 0 END) AS missing_Client_Name,
    SUM(CASE WHEN Client_Industry IS NULL OR Client_Industry = '' THEN 1 ELSE 0 END) AS missing_Client_Industry,
    SUM(CASE WHEN Handling_Attorney IS NULL OR Handling_Attorney = '' THEN 1 ELSE 0 END) AS missing_Handling_Attorney,
    SUM(CASE WHEN Attorney_Level IS NULL OR Attorney_Level = '' THEN 1 ELSE 0 END) AS missing_Attorney_Level,
    SUM(CASE WHEN Billing_Type IS NULL OR Billing_Type = '' THEN 1 ELSE 0 END) AS missing_Billing_Type,
    SUM(CASE WHEN Invoice_Status IS NULL OR Invoice_Status = '' THEN 1 ELSE 0 END) AS missing_Invoice_Status,
    SUM(CASE WHEN Hours_Logged IS NULL THEN 1 ELSE 0 END) AS missing_Hours_Logged,
    SUM(CASE WHEN Hourly_Rate IS NULL THEN 1 ELSE 0 END) AS missing_Hourly_Rate,
    SUM(CASE WHEN Billable_Amount IS NULL THEN 1 ELSE 0 END) AS missing_Billable_Amount,
    SUM(CASE WHEN Discount_Given IS NULL THEN 1 ELSE 0 END) AS missing_Discount_Given,
    SUM(CASE WHEN Tax_Amount IS NULL THEN 1 ELSE 0 END) AS missing_Tax_Amount,
    SUM(CASE WHEN Net_Revenue IS NULL THEN 1 ELSE 0 END) AS missing_Net_Revenue,
    SUM(CASE WHEN Amount_Collected IS NULL THEN 1 ELSE 0 END) AS missing_Amount_Collected,
    SUM(CASE WHEN Write_Offs IS NULL THEN 1 ELSE 0 END) AS missing_Write_Offs,
    SUM(CASE WHEN Outstanding_Balance IS NULL THEN 1 ELSE 0 END) AS missing_Outstanding_Balance,
    SUM(CASE WHEN Days_to_Settle IS NULL OR Days_to_Settle = '' THEN 1 ELSE 0 END) AS missing_Days_to_Settle,
    SUM(CASE WHEN Invoice_Aging_Bucket IS NULL OR Invoice_Aging_Bucket = '' THEN 1 ELSE 0 END) AS missing_Invoice_Aging_Bucket
FROM legal_data;
-- out of the above, just the payment_date, days_to_settle, region and client_industry that are blank

	-- confirmation of the status of the blank payment date
select Invoice_Status, count(*)
from legal_data
where Payment_Date is null or Payment_Date =''
group by Invoice_Status;

									-- DATA CLEANING/UPDATING
SET SQL_SAFE_UPDATES = 0;

create table clean_legal_data as
select distinct * 
from legal_data;

	-- Updating missing regions
update clean_legal_data
set region ='unknown_region'
where region is null or region ='';

	-- Updating missing industries
update clean_legal_data
set client_industry = 'unknown industry'
where client_industry is null or client_industry = '';

	-- Updating missing payment_date
update clean_legal_data
set payment_date = 'Null'
where payment_date is null or payment_date = '';

	-- Updating missing Days_to_settle
update clean_legal_data
set Days_to_settle = 'Null'
where Days_to_settle is Null or Days_to_settle ='';

	-- Remove negative billable amounts
delete from clean_legal_data
where Billable_Amount <0;

	-- Update date_logged
update clean_legal_data
set Date_Logged = 'Null'
where Date_Logged = '0000-00-00';

	-- deleting duplicate 
with Clean as(
	select invoice_id, 
    row_number() over(partition by invoice_id order by invoice_id) as row_num from clean_legal_data
)
Delete from clean_legal_data
where Invoice_ID IN (
	SELECT Invoice_ID
	FROM clean
	where row_num >1);

	-- Standardize Text
update clean_legal_data
set Practice_Area = trim(Practice_Area);

update clean_legal_data
set Handling_Attorney = trim(Handling_Attorney);

set sql_safe_updates = 1;

				-- BUSINESS METRICS/QUestion
select* from legal_data;
select *,
		year(date_logged) as Year,
        month(date_logged) as Month_num,
        monthname(date_logged) as Month_name,
        quarter(date_logged) as Quarter,
		(billable_amount - amount_collected) as Revenue_gap,
	case
		when billable_amount = 0 then 0
        else amount_collected/billable_amount end as Collection_Rate,
	CASE
		WHEN billable_amount = 0 then 0
		else write_offs /billable_amount end as write_offs_rate,
    CASE 
		when Hours_Logged =  0 then 0
        else Amount_Collected/Hours_Logged end as Revenue_per_hr
		from clean_legal_data;

				-- REVENUE PERFORMANCE
	-- Gross billing
            
	-- Total revenue
select 
sum(amount_collected)
from legal_data_metrics;




