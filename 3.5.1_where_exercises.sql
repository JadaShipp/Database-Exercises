USE employees;
SELECT * FROM employees;

#all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya');

#all employees whose last name starts with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'e%';

#all employees hired in the 90s
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

#all employees born on Christmas
SELECT *
FROM employees
WHERE birth_date LIKE '%12%' AND birth_date LIKE '%25%';

#all employees with a 'q' in their last name 
SELECT *
FROM employees
WHERE last_name LIKE '%q%';