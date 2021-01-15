. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL


create database if not exists hello;

use hello;

create table if not exists mytable1 (f1 int not null primary key, f2 varchar(20));
create table if not exists mytable2 (f1 int not null primary key, f2 varchar(20)) engine=memory;
create table if not exists mytable3 (f1 int not null, f2 varchar(20) not null) engine=csv;

show table status;

show create table mytable1\G
show create table mytable2\G
show create table mytable3\G

EOL


