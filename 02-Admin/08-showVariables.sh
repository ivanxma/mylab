. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL

status

show variables like '%connection%';
show variables like '%path%';
show variables like '%file%';
show status like '%user%';

EOL
