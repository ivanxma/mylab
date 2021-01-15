
. ./comm.sh
rm -rf /home/mysql/data/lab22
mysqld --defaults-file=config/my.cnf --initialize-insecure --datadir=/home/mysql/data/lab22 --user=mysql 
