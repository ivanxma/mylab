. ./comm.sh
$MYSQL_HOME/bin/mysql -t -uroot -h127.0.0.1 -P3306 << EOL



select * from information_schema.plugins where plugin_name like 'keyring%'\G

drop database if exists mydb;

create database if not exists mydb;
drop table if exists mydb.mycustomerr;
create table if not exists mydb.mycustomer_enc (custid int not null primary key, credit_card varchar(20), custname varchar(20), address varchar(50)) encryption='Y';
show warnings;
create table if not exists mydb.mycustomer_noenc (custid int not null primary key, credit_card varchar(20), custname varchar(20), address varchar(50)) encryption='N';

select table_name, engine, create_options from information_schema.tables where table_schema = 'mydb';

show create table mydb.mycustomer_enc\G

show variables like '%encryp%';

insert into mydb.mycustomer_enc values (1, "123456789000", "John Chan", "Makarti");
insert into mydb.mycustomer_enc values (2, "987654321000", "Tom Karl", "Makarti");
insert into mydb.mycustomer_enc values (3, "222233334444", "David Tim", "Makarti");
insert into mydb.mycustomer_enc values (4, "444422224444", "Mary Jennifer", "Makarti");

insert into mydb.mycustomer_noenc values (1, "123456789000", "John Chan", "Makarti");
insert into mydb.mycustomer_noenc values (2, "987654321000", "Tom Karl", "Makarti");
insert into mydb.mycustomer_noenc values (3, "222233334444", "David Tim", "Makarti");
insert into mydb.mycustomer_noenc values (4, "444422224444", "Mary Jennifer", "Makarti");

select * from mydb.mycustomer_enc;

EOL

ls -l ~/data/lab22/mydb/mycustomer_*

echo "#strings mycustomer_noenc.ibd"
read

strings ~/data/lab22/mydb/mycustomer_noenc.ibd

echo "hit <ENTER> to continue"

echo "#strings mycustomer_enc.ibd"
read
strings ~/data/lab22/mydb/mycustomer_enc.ibd
