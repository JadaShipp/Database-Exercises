# 1. all employees with the same hire date as employee 101010
USE employees; 
SELECT * 
FROM employees 
WHERE hire_date IN(
		SELECT hire_date
		FROM employees
		WHERE emp_no = 101010);
		
# 2. All the titles held by people with the first name Aamod
SELECT title
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name = "Aamod");
	
# 3. How many people are no longer working at the company

SELECT *
FROM employees 
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_emp.to_date > now());
	
# 4. 
SELECT *

