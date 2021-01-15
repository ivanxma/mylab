. ./comm.sh
if [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
then
mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
shutdown;
EOL
fi
while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	echo "******************************************"
	ps -ef|grep mysqld|grep -v grep
	sleep 5
done

echo "*****************************************"
mysqld_safe --defaults-file=config/my1.cnf &

sleep 2

echo "*****************************************"
echo "*****************************************"
ps -ef|grep mysqld
echo "*****************************************"
echo "*****************************************"

LOGFILE=`grep log-error  config/my1.cnf|cut -f2 -d\=`
echo $LOGFILE
cat $LOGFILE
