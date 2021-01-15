. ./comm.sh

pkill -9 mysqld

while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	sleep 5
	echo "**************************************"
	ps -ef|grep mysqld|grep -v grep
	echo "**************************************"
done


mysqld_safe --defaults-file=config/my1.cnf &
