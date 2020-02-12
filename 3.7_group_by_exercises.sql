USE employees;

# unique titles 
SELECT DISTINCT title 
FROM titles;



# unique last names start and end with 'E'. 
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

# Update last name start's with E to find unique combinations of first and last name 

SELECT CONCAT(first_name, " ", last_name)
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY CONCAT(first_name, " ", last_name);



# Unique last names with a q but not qu
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND NOT LIKE '%qu%'
GROUP BY last_name;




# Add a COUNT() to your results and use ORDER BY to make it easier to find employees 

SELECT last_name, 
count(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;



# Each gender for 'Irena', 'Vidya', or 'Maya'. 

SELECT gender, 
count(*)
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
GROUP BY gender;




# For usernames querry find duplicate usernames?

SELECT
    CONCAT(
        LOWER(LEFT(first_name, 1)),
        LOWER(LEFT(last_name, 4)),
        '_',
        LPAD(MONTH(birth_date), 2, '0'), # month
        RIGHT(YEAR(birth_date), 2) # two digit year
    ) AS username
FROM employees
GROUP BY username;
