. ./comm.sh

if [ $USER != "mysql" ]
then
	echo "Please use mysql as OS user to run the lab"
else

if [ -d /home/mysql/data/3306 ]
then
	rm -rf /home/mysql/data/3306
fi
mkdir -p /home/mysql/data/3306
mysqld --defaults-file=config/my1.cnf --initialize 
LOGFILE=`grep log-error  config/my1.cnf|cut -f2 -d\=`
echo $LOGFILE
cat $LOGFILE

fi
