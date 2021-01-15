. ./comm.sh

if [ $USER != "mysql" ]
then
	echo "Please use mysql as OS user to run the lab"
else

if [ -d /home/mysql/data/lab02 ]
then
	rm -rf /home/mysql/data/lab02
fi
mkdir -p /home/mysql/data/lab02
mysqld --initialize --datadir=/home/mysql/data/lab02 > error.log 2>&1
cat error.log

fi
