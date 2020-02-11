USE employees;
SELECT * FROM employees;

#all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name, first_name DESC;

#all employees whose last name starts with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'e%' OR last_name LIKE '%e%'
ORDER BY last_name DESC;

#all employees whose last name starts and ends with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e'
ORDER BY last_name DESC;

#all employees hired in the 90s
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

#all employees born on Christmas
SELECT *
FROM employees
WHERE birth_date LIKE '%12%' AND birth_date LIKE '%25%';
#all employees hired in the 90s and born on Christmas
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12%' AND birth_date LIKE '%25%'
ORDER BY birth_date, hire_date DESC;


#all employees with a 'q' in their last name 
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

#aLL employees WITH a 'q' IN their LAST NAME but NOT 'qu'
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';






#all employees whose last name starts with 'E' and concat first and last names together
SELECT CONCAT(first_name, " ", last_name) AS full_name,
UPPER(CONCAT(first_name, " ", last_name)) AS FULL_NAME
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY last_name DESC;

#how long have employees hired in the 90s and born on Christmas been working there
SELECT DATEDIFF(NOW(), hire_date) / 365.25 AS time_with_company
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12%' AND birth_date LIKE '%25%'
ORDER BY birth_date, hire_date DESC;


# smallest and largest salaries
SELECT MIN(salary) AS smallest_salary, MAX(salary) AS largest_salary
FROM salaries;

#create username
SELECT first_name, last_name, birth_date,
CONCAT(
LOWER(LEFT(first_name, 1)),
LOWER(LEFT(last_name, 4)),
"_",
LPAD(MONTH(birth_date), 2, '0'),
RIGHT(YEAR(birth_date), 2)
) AS user_name
FROM employees
LIMIT 50;


