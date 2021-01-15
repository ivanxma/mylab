. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL

drop database hello;


show databases;
EOL
