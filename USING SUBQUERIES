--- SUBQUERIES

SELECT *
FROM employee_demographics
WHERE employee_id in
				(SELECT employee_id
					FROM employee_salary WHERE dept_id = 1);
                    
SELECT FIRST_NAME, SALARY,
(SELECT AVG(SALARY)
FROM employee_salary) AS AVG_SALARY
FROM employee_salary 
;

SELECT GENDER,  avg(SALARY) 
FROM employee_salary SAL
JOIN employee_demographics DEM
ON DEM.employee_id = SAL.employee_id
GROUP BY GENDER
;


SELECT DEM.FIRST_NAME, SAL.SALARY, DEM.gender, AVG(SAL.SALARY) OVER() AS OV_GEN
FROM employee_salary SAL
JOIN employee_demographics DEM
ON SAL.employee_id = DEM.employee_id
GROUP BY DEM.first_name, SAL.salary, DEM.gender;


SELECT * FROM employee_salary
