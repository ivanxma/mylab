. ./comm.sh

mysql -uuser1 -h127.0.0.1 -P3306 -puser << EOL

select f1, f2 from mydb.usertable1;
EOL
