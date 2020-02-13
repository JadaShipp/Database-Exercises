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

CREATE TABLE better_pay AS

SELECT salary, dept_name
FROM employees.salaries 
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE salaries.to_date > now();


SELECT AVG(salary) AS x_bar
FROM better_pay;

SELECT STD(salary) AS stdv 
FROM better_pay;

ALTER TABLE better_pay ADD salary_z_score FLOAT;

SELECT *
FROM better_pay;



SELECT salary
FROM curie_950.better_pay;

SELECT *
FROM neumerator;

ALTER TABLE neumerator ADD top_part INT;

SELECT * FROM neumerator

SELECT AVG(salary) AS x_bar
FROM neumerator;

CREATE TEMPORARY TABLE neumerator AS 
SELECT salary - (SELECT AVG(salary) FROM employees.salaries) AS neumerator
FROM employees.salaries;
