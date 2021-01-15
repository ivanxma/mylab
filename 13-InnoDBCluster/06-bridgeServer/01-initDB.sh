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

if [ -d /home/mysql/data/3316 ]
then
	rm -rf /home/mysql/data/3316
fi
mkdir -p /home/mysql/data/3316

mysqld --defaults-file=config/my3306.cnf --initialize-insecure 
mysqld --defaults-file=config/my3316.cnf --initialize-insecure 

fi
