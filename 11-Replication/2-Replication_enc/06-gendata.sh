. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316  << EOL1

create database if not exists test1;
use test1;
create table if not exists mytable1 (f1 int not null auto_increment primary key, f2 varchar(20));

insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
insert into mytable1 (f2) values ('aaaaaaaaaaaaaaa');
EOL1

