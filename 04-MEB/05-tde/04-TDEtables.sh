. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL

select plugin_name, plugin_status, load_option from information_schema.plugins where plugin_name like '%keyring%';

create database if not exists mydb2;
create table if not exists mydb2.mytable (f1 int not null primary key, f2 varchar(200));
create table if not exists mydb2.mytable_enc (f1 int not null primary key, f2 varchar(200)) encryption='Y';

truncate mydb2.mytable;
truncate mydb2.mytable_enc;

insert into mydb2.mytable values (1, 'hello world'), (2, 'hello world'), (3, 'hello world');
insert into mydb2.mytable_enc values (1, 'hello world'), (2, 'hello world'), (3, 'hello world');

select "mytable",x.* from mydb2.mytable x;
select "mytable_enc", x.* from mydb2.mytable_enc x;

EOL
