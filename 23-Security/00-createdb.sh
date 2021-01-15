. ./comm.sh

rm -rf /home/mysql/data/lab23
mkdir -p /home/mysql/data/lab23

$MYSQLBASE/bin/mysqld --defaults-file=config/my1.cnf --initialize-insecure --datadir=/home/mysql/data/lab23 --user=mysql

