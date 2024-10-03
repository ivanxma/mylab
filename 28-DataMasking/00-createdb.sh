
. ./comm.sh
rm -rf /home/mysql/data/lab28
mysqld --defaults-file=config/my.cnf --initialize-insecure --datadir=/home/mysql/data/lab28 --user=mysql 
