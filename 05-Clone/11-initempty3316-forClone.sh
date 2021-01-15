. ./comm.sh

if [ -d /home/mysql/data/3316 ]
then
	rm -rf /home/mysql/data/3316
fi
mkdir -p /home/mysql/data/3316
mysqld --defaults-file=config/my2.cnf --initialize-insecure 
LOGFILE=`grep log-error  config/my2.cnf|cut -f2 -d\=`
echo $LOGFILE
cat $LOGFILE

