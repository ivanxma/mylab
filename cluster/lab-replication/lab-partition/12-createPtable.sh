. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL

create database if not exists test;
use test;
drop table if exists department;
drop table if exists employee;
drop table if exists job_history;

create table department (
	deptid int not null primary key,
	depart_name varchar(30),
	mgr_id int
) engine=ndb partition by key(deptid);

create table employee (
	empid int not null,
	deptid int not null,
	emp_name varchar(30),
	primary key(empid, deptid)
) engine=ndb partition by key (deptid);

create table job_history (
	empid int not null,
	job_date	date not null,
	job_title	varchar(30),
	primary key(empid, job_date)
) engine=ndb partition by key (empid);


create unique index udx_emp1 on employee (empid);

EOL

