. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3316 << EOL1

drop user if exists repl@'localhost';
create user repl@'localhost' identified with mysql_native_password by 'repl';
grant replication slave on *.* to repl@'localhost';
flush privileges;

drop user if exists demo@'%';
create  user demo@'%' identified by 'demo';
grant all on *.* to demo@'%';
flush privileges;
select @@hostname, @@port, host,user from mysql.user;
EOL1

mysql -t -uroot -h127.0.0.1 -P3326 << EOL2

drop user if exists repl@'localhost';
create user repl@'localhost' identified with mysql_native_password by 'repl';
grant replication slave on *.* to repl@'localhost';
flush privileges;

drop user if exists demo@'%';
create  user demo@'%' identified by 'demo';
grant all on *.* to demo@'%';
flush privileges;
select @@hostname, @@port, host,user,plugin from mysql.user;
EOL2


mysql -t -uroot -h127.0.0.1 -P3336 << EOL3

drop user if exists repl@'localhost';
create user repl@'localhost' identified with mysql_native_password by 'repl';
grant replication slave on *.* to repl@'localhost';
flush privileges;

drop user if exists demo@'%';
create  user demo@'%' identified by 'demo';
grant all on *.* to demo@'%';
flush privileges;
select @@hostname, @@port, host,user,plugin from mysql.user;
EOL3




