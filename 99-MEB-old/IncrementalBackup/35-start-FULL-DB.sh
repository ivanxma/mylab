. ./comm.sh

echo "*****************************************"
mysqld_safe --defaults-file=config/my2.cnf &

sleep 2

echo "*****************************************"
echo "*****************************************"
ps -f|grep mysqld
echo "*****************************************"
echo "*****************************************"

ERRORLOG=`grep log-error config/my2.cnf|cut -f2 -d=`
tail  $ERRORLOG
