. ./comm.sh

mkdir -p config/3326
cp /home/mysql/data/3326/auto.cnf config/3326/auto.cnf
cp /home/mysql/data/3326/mysqld-auto.cnf config/3326/mysqld-auto.cnf


echo "Are you sure to Kill the server and remove the data files (y/n)?"
read REPLY

if [ "$REPLY" == "y" ]
then
	mysql -uroot -h127.0.0.1 -P3326 -pmysql -e "shutdown;"
	sleep 10;

	rm -rf /home/mysql/data/3326
else
	echo "No action and exit!"
fi



# backup the data from 3316 and restore to 3326 




