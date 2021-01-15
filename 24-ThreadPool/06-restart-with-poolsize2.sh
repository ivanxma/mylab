. ./comm.sh
mysqladmin -uroot -h127.0.0.1 shutdown
sleep 2
mysqld --defaults-file=config/my-threadpool-size2.cnf &
