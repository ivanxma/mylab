. ./comm.sh

mysql -uuser1 -h127.0.0.1 -P3306 -puser << EOL

create table if not exists mydb.usertable1 (f1 int not null primary key, f2 varchar(20));
truncate mydb.usertable1;

insert into mydb.usertable1 values (1, 'data');
insert into mydb.usertable1 values (2, 'data');
insert into mydb.usertable1 values (3, 'data');
insert into mydb.usertable1 values (4, 'data');
insert into mydb.usertable1 values (5, 'data');
insert into mydb.usertable1 values (6, 'data');
insert into mydb.usertable1 values (7, 'data');
EOL
