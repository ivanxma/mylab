. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -e "shutdown;"
mysql -uroot -h127.0.0.1 -P3316 -e "shutdown;"
sleep 5
mysqld_safe --defaults-file=config/my3306.cnf &
mysqld_safe --defaults-file=config/my3316.cnf &

sleep 2
echo "Tailing the error log file : /home/mysql/data/3306/my.error"
tail /home/mysql/data/3306/my.error
echo "Tailing the error log file : /home/mysql/data/3316/my.error"
tail /home/mysql/data/3316/my.error
