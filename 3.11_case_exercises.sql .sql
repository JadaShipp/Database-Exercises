USE employees;

#1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

# Using case statement

SELECT from_date,to_date, emp_no, dept_no, 
CASE to_date
	WHEN to_date > now() THEN 1 
	ELSE 0
	END AS is_current_employee
FROM dept_emp;

# Using If statement

SELECT from_date,to_date, emp_no, dept_no,
IF(to_date > now(),1,0)
AS is_current_employee
FROM dept_emp;


#2 Write a query that returns all employee names, and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name,
CASE 
WHEN last_name = < "I%" THEN "A-H"
WHEN last_name = < "J%" THEN "I-Q"
WHEN last_name = < "R%" THEN "R-Z"
ELSE other
END AS alpha_group
FROM employees


#3 How many employees were born in each decade?
SELECT min(birth_date)
FROM employees

SELECT
count(*),(CASE
	WHEN birth_date > "199%" THEN "90s"
	WHEN birth_date > "198%" THEN "80s"
	WHEN birth_date > "197%" THEN "70s"
	WHEN birth_date > "196%" THEN "60s"
	WHEN birth_date > "195%" THEN "50s"
	ELSE 0
	END) AS decade_groups
FROM employees
GROUP BY decade_groups;

# Bonus
#What is the average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?


SELECT DISTINCT(CASE 
	WHEN dept_name IN ('research', 'development')  THEN 'R&D'
	WHEN dept_name IN ('sales', 'marketing') THEN 'sales&marketing'
	WHEN dept_name IN ('production', 'quality management') THEN 'prod&QM'
	WHEN dept_name IN ('finance','human resources') THEN 'Finance & HR'
ELSE dept_name
END) AS dept_group
FROM departments
GROUP BY dept_name;
 




