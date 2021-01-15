. ./comm.sh
mysql -uroot -h127.0.0.1 -P3310 << EOL

drop user if exists demo@'%';

create user demo@'%' identified by 'demo';
create database if not exists demo;
grant all on *.* to demo@'%';


drop table if exists demo.mytable;
drop table if exists demo.user;

create table demo.mytable (f1 int not null auto_increment primary key, f2 varchar(20), mytime timestamp default now());

create table demo.user (f1 int not null auto_increment primary key, firstname varchar(20), lastname varchar(20), mytime timestamp default now());


EOL




