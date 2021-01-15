mysql -uroot -h127.0.0.1 << EOL

create database if not exists mytest;

create table mytest.mytable (f1 int not null auto_increment primary key, f2 varchar(20));

EOL
