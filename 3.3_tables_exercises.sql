# All tables in the database: departments, dept_emp, dept_manager, employees, employees_with_departments, salaries, titles
# Data types of employees table include: INT, DATE, VARCHAR, ENUM
#Tables containing numeric type column: Any table containing an employee number, date or salary (dept_emp,dept_manager, employees, employees_with_departments, salaries, titles)
#Tables conaining string type: any table that includes an employee name, employee titles, or department name (dept_emp, dept_manager, employees, employees_with_departments, salaries)
#Tables containing the date: Any table containing a component of time (titles, salaries, dept_emp,dept_manager, employees,)
#Employees exist within departments 
SHOW CREATE TABLE employees;
SHOW CREATE TABLE dept_manager;