CREATE TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

ALTER TABLE employees_with_departments ADD full_name VARCHAR (30) NOT NULL;

UPDATE employees_with_departments 
SET full_name = CONCAT (first_name, " ", last_name);


 