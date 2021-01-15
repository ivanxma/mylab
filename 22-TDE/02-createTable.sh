. ./comm.sh
$MYSQL_HOME/bin/mysql -t -uroot -h127.0.0.1 -P3306 << EOL



select * from information_schema.plugins where plugin_name like 'keyring%'\G

drop database if exists mydb;

create database if not exists mydb;
drop table if exists mydb.mytable;
create table if not exists mydb.mytable_enc (f1 int not null primary key, f2 varchar(20), f3 varchar(50)) encryption='Y';
show warnings;
create table if not exists mydb.mytable (f1 int not null primary key, f2 varchar(20), f3 varchar(50)) encryption='N';
show warnings;
create table if not exists mydb.mytable_cmp (f1 int not null primary key, f2 varchar(20), f3 varchar(50)) compression='lz4';
show warnings;


select table_name, engine, create_options from information_schema.tables where table_schema = 'mydb';

show create table mydb.mytable_enc\G


show variables like '%encryp%';
EOL
