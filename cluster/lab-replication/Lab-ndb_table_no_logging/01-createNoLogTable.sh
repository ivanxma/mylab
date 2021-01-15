. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316 << EOL

use test;
drop table if exists testnolog1;
drop table if exists testyeslog1;

set ndb_table_no_logging=1;
create table testnolog1 (f1 int not null primary key, f2 varchar(100)) engine=ndb;

set ndb_table_no_logging=0;
create table testyeslog1 (f1 int not null primary key, f2 varchar(100)) engine=ndb;
EOL

mysql -uroot -h127.0.0.1 -P3316 << EOL1

insert into test.testnolog1 values (1, 'hello');
insert into test.testnolog1 values (2, 'hello');
set sql_log_bin=0;
insert into test.testyeslog1 values (1, 'hello');
insert into test.testyeslog1 values (2, 'hello');

select * from test.testnolog1;
select * from test.testyeslog1;
EOL1

ndb_desc -d test testnolog1
echo "Press <ENTER>"
read
ndb_desc -d test testyeslog1
