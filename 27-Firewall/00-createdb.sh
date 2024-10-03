
. ./comm.sh
rm -rf /home/mysql/data/lab27
mysqld --defaults-file=config/my.cnf --initialize-insecure --datadir=/home/mysql/data/lab27 --user=mysql 
