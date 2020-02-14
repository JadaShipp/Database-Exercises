#1.0

CREATE TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

ALTER TABLE employees_with_departments ADD full_name VARCHAR (30) NOT NULL;

UPDATE employees_with_departments 
SET full_name = CONCAT (first_name, " ", last_name);


ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

#2.0
CREATE TEMPORARY TABLE temp_pay AS 
SELECT payment_id, customer_id, staff_id, amount, payment_date, last_update
FROM sakila.payment;

SELECT *
FROM temp_pay;

DESCRIBE temp_pay;

ALTER TABLE temp_pay MODIFY amount DECIMAL(10,2);

UPDATE temp_pay SET amount = amount * 100;

ALTER TABLE temp_pay MODIFY amount INT;

SELECT *
FROM temp_pay;



#3.0

USE employees;

CREATE TABLE best_dept
AS 
SELECT dept_name, AVG(salary) AS Highest_Average_Salary
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE dept_emp.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name


ALTER TABLE best_dept ADD salary_z_score FLOAT(36);

CREATE TABLE numbers AS 
SELECT AVG(salary) AS mean, STD(salary) AS stdv
FROM employees.salaries
WHERE salaries.to_date > now();

ALTER TABLE best_dept ADD top_part FLOAT(36);
ALTER TABLE best_dept ADD bottom_part FLOAT(36);


UPDATE best_dept
SET top_part = (Highest_Average_Salary - (SELECT mean FROM numbers));

UPDATE best_dept
SET bottom_part = (top_part / (SELECT stdv FROM numbers));

SELECT *
FROM best_dept;

