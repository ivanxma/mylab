. ./comm.sh

MYPID=`ps -ef|grep mysqlrouter|grep -v grep|awk '{print $2}'`
echo $MYPID
if [ "$MYPID" != "" ]
then
	kill -9 $MYPID
fi

mysqlrouter --bootstrap root@localhost:3310 --directory config/myrouter --force

## mysqlrouter --config=config/myrouter/mysqlrouter.conf &

