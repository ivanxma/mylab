. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL


create database if not exists mydelta;
set sql_log_bin=0;
create table mydelta.mytableA select * from mydb.mytable1;
create table mydelta.mytableB select * from mydb.mytable2;
set sql_log_bin=1;

EOL
