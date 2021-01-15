. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL


status
drop user if exists user0;
drop user if exists user1@'localhost';
drop user if exists user2@'%';
drop user if exists user2@'localhost';
drop user if exists user3@'localhost';

create user user0 identified by 'user0';
create user user1@'localhost' identified by 'user1';
create user user2@'%' identified with mysql_native_password by 'user2';
create user user2@'localhost' identified with mysql_native_password by 'user2';
create user user3@'localhost' identified by 'user3';


alter user user3@'localhost' account lock;
alter user user3@'localhost' password expire;

alter user user2@'localhost' with max_queries_per_hour 5 max_updates_per_hour 5 max_connections_per_hour 5 max_user_connections 3;


select host,user,plugin,max_questions, max_updates, max_connections, max_user_connections,account_locked, password_expired from mysql.user order by user;

EOL
