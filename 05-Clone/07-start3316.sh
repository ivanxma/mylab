. ./comm.sh

mysqld_safe --defaults-file=config/my2.cnf &

sleep 2
echo "Tailing the error log file : /home/mysql/data/3316/my.error"
tail /home/mysql/data/3316/my.error
