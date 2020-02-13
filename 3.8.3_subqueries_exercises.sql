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
	
# 4. All current department managers that are female
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
	WHERE dept_manager.to_date > now()) AND gender = "F";
	
# 5. All current employees that have a higher than average salary
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries
	WHERE salary > (SELECT AVG(salary)
		FROM salaries)
	AND to_date > NOW())
LIMIT 5;

# 6. How many current salaries are within 1 standard deviation of the highest salary
# what percentage of all salaries is this?

SELECT count(*)
FROM salaries
WHERE to_date > now() AND salary > ((SELECT MAX(salary) - STD(salary)
FROM salaries));



