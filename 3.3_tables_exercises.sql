USE employees;

DESCRIBE employees

# All tables in the database: departments, dept_emp, dept_manager, employees, employees_with_departments, salaries, titles
# Data types of employees table include: INT, DATE, VARCHAR, ENUM
# Tables containing numeric type column: Any table containing an employee number, date or salary (dept_emp,dept_manager, employees, employees_with_departments, salaries, titles)
# Tables conaining string type: any table that includes an employee name, employee titles, or department name (dept_emp, dept_manager, employees, employees_with_departments, salaries)
# Tables containing the date: Any table containing a component of time (titles, salaries, dept_emp,dept_manager, employees,)
# Both the employees table and the departments tables have a name and identifiyer (employee number or department number)
SHOW CREATE TABLE employees;
/* CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */
