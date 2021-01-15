. ./comm.sh
mysqladmin -uroot -h127.0.0.1 -P3306 shutdown
mysqladmin -uroot -h127.0.0.1 -P3316 shutdown
sleep 5
mysqld --defaults-file=config/myG1.cnf  \
	> /home/mysql/data/my.log 2>&1 &
mysqld --defaults-file=config/myG2.cnf   \
	> /home/mysql/data2/my.log 2>&1 &

