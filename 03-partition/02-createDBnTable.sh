. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql<< EOL

create database if not exists mytest;

drop table if exists mytest.mytrans;
drop table if exists mytest.mycustomer;
create table if not exists mytest.mycustomer (
	custid	varchar(10) not null primary key,
	custname varchar(30) not null,
	addr1 varchar(50) not null,
	addr2 varchar(50) null,
	city varchar(20) null,
	country varchar(10) not null,
	phone1 varchar(15),
	phone2 varchar(15),
	phone3 varchar(15),
	email1 varchar(50),
	email2 varchar(50)
);

create table if not exists mytest.mytrans (
	txnid int auto_increment not null ,
	txndate datetime(6) not null ,
	custid varchar(10),
	location varchar(20),
	callnum varchar(15),
-- foreign key (custid) references mytest.mycustomer(custid)
	primary key (txnid, txndate)
) ;

EOL
