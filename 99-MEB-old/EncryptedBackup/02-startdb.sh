. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
shutdown;
EOL
sleep 5

echo "*****************************************"
mysqld_safe --defaults-file=config/my1.cnf &

sleep 2

echo "*****************************************"
echo "*****************************************"
ps -ef|grep mysqld
echo "*****************************************"
echo "*****************************************"
echo "Tailing the error log file : /home/mysql/data/lab02/my.error"
tail  /home/mysql/data/lab02/my.error
