SELECT * FROM parks_and_recreation.employee_demographics;

SELECT * FROM parks_and_recreation.employee_salary;

SELECT FIRST_NAME,
last_name,
birth_date,
age,
(age + 10) * 10 + 10
 FROM employee_demographics;

-- PEMDAS - Parantesis, exponient, multiplication, addition, substraction
-- USING DISTINCT
SELECT DISTINCT GENDER
FROM employee_demographics;


-- USING WHERE, AND, OR
SELECT * 
FROM employee_salary
WHERE
SALARY >= 50000
ORDER BY employee_id
;

-- USING ORDER BY AND GROUP BY
SELECT first_name, avg(AGE) 
FROM employee_demographics
GROUP BY first_name
;

select distinct first_name, last_name
 FROM employee_demographics
 WHERE AGE>44;
 
 -- USING LIMIT AND ALIASING
 SELECT * 
FROM employee_demographics
ORDER BY AGE DESC
LIMIT 3
; 

SELECT * 
FROM employee_demographics
ORDER BY AGE DESC
LIMIT 2, 1
; 
 -- ALIASING
SELECT GENDER, AVG (AGE) AS AVE_AGE
FROM employee_demographics
GROUP BY GENDER
HAVING AVG (AGE) > 40
; 

 -- USING JOINS
 SELECT * 
 FROM employee_demographics AS EMD
 INNER JOIN employee_salary AS EMS
	ON EMD.employee_id = EMS.employee_id
 ;
 
  SELECT EMD.employee_id, AGE, occupation
 FROM employee_demographics AS EMD
 LEFT JOIN employee_salary AS EMS
	ON EMD.employee_id = EMS.employee_id
 ;
 
  -- USING OUTER JOINS
  SELECT *
 FROM employee_salary AS EMD
 LEFT JOIN employee_demographics AS EMS
	ON EMD.employee_id = EMS.employee_id
 ;
 
 -- USING SELF JOIN
 SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
EMP1.last_name AS last_name_santa,
EMP2.employee_id AS emp_name_emp,
EMP2.first_name AS first_name_emp,
EMP2.last_name AS last_name_emp
 FROM employee_salary AS EMP1
 JOIN employee_salary AS EMP2
	ON EMP1.employee_id + 1 = EMP2.employee_id
 ;
 
 -- JOINING MULTIPLE TABLES TOGETHER
SELECT * 
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id 
 ;
 
 -- USING UNION
 SELECT first_name, last_name, 'OLD MAN' AS LABEL
 FROM employee_demographics
 WHERE AGE > 40 AND GENDER = 'MALE'
 UNION
 SELECT first_name, last_name, 'OLD WOMAN' AS LABEL
 FROM employee_demographics
 WHERE AGE > 40 AND GENDER = 'FEMALE'
 UNION
  SELECT first_name, last_name, 'HIGHLY PAID EMPLOYEE' AS LABEL
 FROM employee_salary
 WHERE SALARY > 70000 
 ;
