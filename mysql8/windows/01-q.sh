. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

use employees;

-- FIRST_VALUE(salary) over (partition by department_id order by salary desc) - salary as diff
-- FROM employee WINDOW w as (Partition by department_id order by salary desc)
explain
SELECT name, dept_no, salary,
	FIRST_VALUE(salary) over (partition by dept_no order by salary desc) - salary as diff
	FROM v_employee
;

-- list salary for the employee and the different between the highest salary in the department
SELECT name, dept_no, salary, FIRST_VALUE(salary) over w as Dept_highest_salary,
	FIRST_VALUE(salary) over w - salary as diff
FROM v_employee WINDOW w as (Partition by dept_no order by salary desc)
limit 100;

EOL
