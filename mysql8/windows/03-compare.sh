. ./comm.sh


echo "Timing for using window query ..."

time mysql -t -uroot -h127.0.0.1 << EOL2

use employees;

explain
select name as aname, dept_no, salary,
	sum(salary) over w as sum_salary
from v_employee
window w as (order by salary desc, name asc rows unbounded preceding)
order by sum_salary asc, name asc;

select @t:=sysdate(6);
select name as aname, dept_no, salary,
	sum(salary) over w as sum_salary
from v_employee
window w as (order by salary desc, name asc rows unbounded preceding)
order by sum_salary asc, name asc;

select @t as start_time, timediff(sysdate(6), @t);
EOL2

echo "Timing for using sub query..."

time mysql -t -uroot -h127.0.0.1 << EOL

use employees;

explain format=json
select name as o_name, dept_no, salary as o_salary, 
	(select sum(salary) as sum_salary 
		from v_employee 
		where salary <=o_salary and not (salary = o_salary and o_name = name)
	) as sum_salary
from v_employee
order by sum_salary, name;

select name as o_name, dept_no, salary as o_salary, 
	(select sum(salary) as sum_salary 
		from v_employee 
		where salary <=o_salary and not (salary = o_salary and o_name = name)
	) as sum_salary
from v_employee
order by sum_salary, name;

EOL
