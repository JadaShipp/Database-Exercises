USE employees;
SELECT dept_name, concat(first_name, " ", last_name) as "Current Manager", salary
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date > NOW() AND salaries.to_date > now();