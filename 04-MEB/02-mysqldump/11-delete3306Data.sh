. ./comm.sh

echo "***********shutting down mysqld 3306 ***************"
mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "shutdown;"
echo "**************************"
while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	sleep 2
	ps -ef|grep mysqld|grep -v grep
done
echo "***********   completed  ***************"
echo "***********   deleting the data folder ***************"

du -sh /home/mysql/data/3306

rm -rf /home/mysql/data/3306

du -sh /home/mysql/data/3306




