. ./comm.sh
$MYSQL_HOME/bin/mysql -t -uroot -h127.0.0.1 -P3306 -e shutdown;
$MYSQL_HOME/bin/mysqld --defaults-file=config/my_efw.cnf &

