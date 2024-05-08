. ./comm.sh
mysql -uroot -h127.0.0.1 -P$1 << EOL

create database wordpress;
create user wordpress@'%' identified by 'wordpress';
grant all on wordpress.* to wordpress@'%';

EOL
