
. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "select @@hostname, @@port, user,host from mysql.user;"
mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "select @@hostname, @@port, user,host from mysql.user;"
