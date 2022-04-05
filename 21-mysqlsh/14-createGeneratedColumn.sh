. ./comm.sh

mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 << EOL

alter table world_x.mytest01 add myname varchar(30) as (doc->>"$.name");
alter table world_x.mytest01 add myage varchar(30) as (doc->>"$.age");
alter table world_x.mytest01 add myweight varchar(30) as (doc->>"$.weight");
alter table world_x.mytest01 add myheight varchar(30) as (doc->>"$.height");


select  myname, myage, myweight, myheight from world_x.mytest01;

EOL
