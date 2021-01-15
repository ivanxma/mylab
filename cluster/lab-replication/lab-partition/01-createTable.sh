. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316 << EOL

use test;
drop table if exists department;
drop table if exists employee;
drop table if exists job_history;

create table department (
	deptid int not null primary key,
	depart_name varchar(30),
	mgr_id int
) engine=ndb;

create table employee (
	empid int not null,
	deptid int not null,
	emp_name varchar(30),
	primary key(empid)
) engine=ndb;

create table job_history (
	empid int not null,
	job_date	date not null,
	job_title	varchar(30),
	primary key(empid, job_date)
) engine=ndb;


EOL

