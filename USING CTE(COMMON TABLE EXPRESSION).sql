
WITH CTE_EXAMPLE AS 
(
SELECT GENDER, avg(SALARY) AVG_SAL, min(SALARY) MIN_SAL, max(SALARY) MAX_SAL, count(SALARY) COUNT_SAL
FROM employee_demographics DEM
JOIN employee_salary SAL
	ON DEM.employee_id = SAL.employee_id
GROUP BY GENDER
)
SELECT avg(AVG_SAL)
FROM CTE_EXAMPLE
;


SELECT MAX(D_ID), MAX(MAX_SAL)
FROM(SELECT DEM.employee_id D_ID, GENDER, avg(SALARY) AVG_SAL, min(SALARY) MIN_SAL, max(SALARY) MAX_SAL, count(SALARY) COUNT_SAL
FROM employee_demographics DEM
JOIN employee_salary SAL
	ON DEM.employee_id = SAL.employee_id
GROUP BY DEM.employee_id, GENDER
)  AS AV_EXAMPLE
;

WITH CTE_EXAMPLE AS 
(
SELECT first_name, GENDER, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_EXAMPLE2 AS
(SELECT first_name, SALARY
FROM EMPLOYEE_SALARY
WHERE SALARY > 50000
)
SELECT *
FROM CTE_EXAMPLE 
JOIN CTE_EXAMPLE2 
	ON CTE_EXAMPLE.first_name = CTE_EXAMPLE2.first_name
;