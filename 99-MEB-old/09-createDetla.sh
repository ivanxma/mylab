. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL


create database if not exists test;
set sql_log_bin=0;
create table test.mytableA select * from mysql.user;
create table test.mytableB select * from mysql.user;
set sql_log_bin=1;

EOL
