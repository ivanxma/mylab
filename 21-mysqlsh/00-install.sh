. ./comm.sh

rm -rf /home/mysql/data/lab21
mkdir -p /home/mysql/data/lab21

mysqld --initialize-insecure --datadir=/home/mysql/data/lab21
mysqld --defaults-file=config/my.cnf &

ALIVE=0

while [ $ALIVE -eq 0 ]
do
	ALIVE=`mysqladmin -uroot -h127.0.0.1 -P3310 ping|grep alive|wc -l`
	echo "waiting mysqld Up and Running ...."
	sleep 1
done
mysqladmin -uroot -h127.0.0.1 -P3310 ping

# change password

mysql -uroot -h127.0.0.1 -P3310 -e "alter user root@'localhost' identified by 'welcome1';"


