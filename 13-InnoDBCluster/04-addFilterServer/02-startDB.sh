. ./comm.sh

mysqld_safe --defaults-file=config/my3306-start.cnf &

sleep 2
echo "Tailing the error log file : /home/mysql/data/3306/my.error"
tail /home/mysql/data/3306/my.error
