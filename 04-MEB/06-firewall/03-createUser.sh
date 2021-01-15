. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

create user 'user1'@'localhost' identified by 'user';
create user 'user2'@'localhost' identified by 'user';
create user 'user3'@'localhost' identified by 'user';

grant all on mydb.* to user1@localhost;
grant all on mydb.* to user2@localhost;
grant all on mydb.* to user3@localhost;

EOL
