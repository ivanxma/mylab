. ./comm.sh

mysqld --defaults-file=config/my1.cnf &

sleep 2
echo "Tailing the error log file : /home/mysql/data/lab02/my.error"
tail /home/mysql/data/lab02/my.error
