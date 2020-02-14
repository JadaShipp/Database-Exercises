USE employees;

#1.0

SELECT from_date,to_date, emp_no, dept_no, 
CASE to_date
	WHEN to_date > now() THEN 1 
	ELSE 0
	END AS is_current_employee
FROM dept_emp;

SELECT from_date,to_date, emp_no, dept_no,
IF(to_date > now(),1,0)
AS is_current_employee
FROM dept_emp;


#2