. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "set global mysql_firewall_trace=on;"
mysql -uuser1 -h127.0.0.1 -P3306 -puser << EOL

select f1, f2 from mydb.usertable1;
EOL

tail /home/mysql/data/3306/my.error
