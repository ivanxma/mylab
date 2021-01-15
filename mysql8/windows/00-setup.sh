. ./comm.sh



(cd /opt/download/test_db-master;mysql -uroot -h127.0.0.1 < employees.sql;cd -)

mysql -uroot -h127.0.0.1 << EOL

use employees;

create table mysalaries select distinct emp_no, salary,from_date from salaries s1 where (s1.emp_no,s1.from_date) = (select s2.emp_no, max(s2.from_date) from salaries s2 where s1.emp_no = s2.emp_no group by s2.emp_no);

create view v_employee as select concat(first_name,' ',last_name) as name, dept_no, salary from employees, salaries, current_dept_emp where employees.emp_no = salaries.emp_no and current_dept_emp.emp_no = employees.emp_no;

create table latest_salary as select distinct emp_no, first_value(salary) over w as latest_salary from salaries   window w as (partition by emp_no order by from_date desc ) ;

create index idx_latest_salary_emp_no on latest_salary(emp_no);

create table latest_dept as select distinct emp_no, first_value(dept_no) over w as latest_dept_no from dept_emp   window w as (partition by emp_no order by from_date desc ) ;

create index idx_latest_dept_emp_no on latest_dept(emp_no);

create table myemployee as 
select employees.emp_no, concat(first_name, ' ', last_name) as name, latest_dept_no, latest_salary.latest_salary
from employees, latest_salary, latest_dept
where employees.emp_no = latest_salary.emp_no
and employees.emp_no = latest_dept.emp_no;

EOL
