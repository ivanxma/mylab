. ./comm.sh
#Do some transaction
#create table
#insert ...
#	showing data is in the data nodes

mysql -uroot -h127.0.0.1 -P3306 << EOL
create database if not exists test;

drop table if exists test.mytable ;
create table test.mytable ( f1 int not null auto_increment primary key, f2 varchar(20)) engine=ndb;
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');
insert into test.mytable (f2) values ('hello');

select * from test.mytable;
EOL
echo "Press <ENTER> to continue"
read

ndb_desc -c $PRIMARY -d test -p mytable


