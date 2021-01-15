. ./comm.sh
#Do some transaction
#create table
#insert ...
#	showing data is in the data nodes

mysql -uroot -h127.0.0.1 -P3316 << EOL
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

drop table if exists test.mytable_fully;

create table test.mytable_fully ( f1 int not null auto_increment primary key, f2 varchar(20)) engine=ndb COMMENT='NDB_TABLE=READ_BACKUP=1,FULLY_REPLICATED=1,NOLOGGING=0,PARTITION_BALANCE=FOR_RP_BY_LDM';

insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
insert into test.mytable_fully (f2) values ('hello');
EOL
echo "Press <ENTER> to continue"
read

ndb_desc -c $PRIMARY -d test -p mytable
ndb_desc -c $PRIMARY -d test -p mytable_fully


