. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

create database if not exists mytest;

create table if not exists mytest.mytable (f1 int not null auto_increment primary key, f2 varchar(100));

EOL

echo "delete this file to stop" > removeMeToStop.txt

(while [ -f removeMeToStop.txt ]; do mysql -uroot -h127.0.0.1 -P3306 -e "select sleep(rand()); insert into mytest.mytable (f2) values (concat('testing data from' , @@hostname, @@port));"; done) &

(while [ -f removeMeToStop.txt ]; do mysql -uroot -h127.0.0.1 -P3316 -e "select sleep(rand()); insert into mytest.mytable (f2) values (concat('testing data from' , @@hostname, @@port));"; done) &

wait

