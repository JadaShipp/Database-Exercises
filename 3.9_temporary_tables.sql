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
 