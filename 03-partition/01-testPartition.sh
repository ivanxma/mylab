. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL

create database if not exists mytest;

drop table if exists mytest.mytrans;
drop table if exists mytest.mycustomer;
create table if not exists mytest.mycustomer (
        custid  varchar(10) not null primary key,
        custname varchar(30) not null,
        addr1 varchar(50) not null,
        addr2 varchar(50) null,
        city varchar(20) null,
        country varchar(10) not null,
        phone1 varchar(15),
        phone2 varchar(15),
        phone3 varchar(15),
        email1 varchar(50),
        email2 varchar(50)
);

create table if not exists mytest.mytrans (
        txnid int auto_increment not null ,
        txndate datetime(6) not null ,
        custid varchar(10),
        location varchar(20),
        callnum varchar(15),
-- foreign key (custid) references mytest.mycustomer(custid)
        primary key (txnid, txndate)
) ;

alter table mytest.mytrans  partition by range (day(txndate)) (
partition p1 values less than (1),
partition p2 values less than (2),
partition p3 values less than (3),
partition p4 values less than (4),
partition p5 values less than (5),
partition p6 values less than (6),
partition p7 values less than (7),
partition p8 values less than (8),
partition p9 values less than (9),
partition p10 values less than (10),
partition pmax values less than (MAXVALUE)
);


select partition_name, subpartition_name, partition_ordinal_position, partition_expression, table_rows, nodegroup, tablespace_name, partition_comment 
from information_schema.partitions where table_name = 'mytrans';

EOL

typeset -i mycounter=0
while [ $mycounter -lt 10 ]
do

echo -n $mycounter

mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"

typeset -i mycounter=$mycounter+1
done


mysql -uroot -pmysql -h127.0.0.1 -e " 
select day(txndate), count(*) from mytest.mytrans group by day(txndate);
"


sleep 5
mysql -uroot -pmysql -h127.0.0.1 -e " 
select partition_name, subpartition_name, partition_ordinal_position, partition_expression, table_rows, nodegroup, tablespace_name, partition_comment 
from information_schema.partitions where table_name = 'mytrans';
show create table mytest.mytrans\G
"

mysql -uroot -pmysql -h127.0.0.1 -e " 
select * from mytest.mytrans where day(txndate) = 4;
explain select * from mytest.mytrans where day(txndate) = 4;
"
