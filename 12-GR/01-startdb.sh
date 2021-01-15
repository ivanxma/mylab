. ./comm.sh
mysqld --defaults-file=config/my.cnf > /home/mysql/data/my.log 2>&1 &
mysqld --defaults-file=config/my2.cnf > /home/mysql/data2/my.log 2>&1 &
mysqld --defaults-file=config/my3.cnf > /home/mysql/data3/my.log 2>&1 &
