use employees;

drop table if exists mysalaries2;

select @t:=sysdate(6);
create table mysalaries2 as
select s1.emp_no, s1.from_date, s1.salary 
from salaries s1, 
	(select s2.emp_no, max(s2.from_date) as fdate 
	from salaries s2 group by s2.emp_no
	) as s3 
where s1.emp_no = s3.emp_no 
and s1.from_date = s3.fdate;
select @t as start_time, timediff(sysdate(6),@t);


drop table if exists latest_salary;

select @t:=sysdate(6);
create table latest_salary as select distinct emp_no, first_value(salary) over w as latest_salary from salaries   window w as (partition by emp_no order by from_date desc ) ;

select @t as start_time, timediff(sysdate(6),@t);
