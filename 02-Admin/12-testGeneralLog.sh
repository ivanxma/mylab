. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL &

set global general_log=true;
select * from mysql.user where 1=2;
select * from mysql.user where 2=3;
select * from mysql.user where 3=4;
select * from mysql.user where 4=5;
set global general_log=false;
EOL

tail -n 10 /home/mysql/data/lab02/virtual-41.log
