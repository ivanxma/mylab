. ./comm.sh

mysqlrouter --bootstrap gradmin:grpass@$CLUSTER_HOST:3310 --force --directory config/myrouter

if [ $? -eq 0 ]
then
	echo "starting router...."
	./config/myrouter/start.sh
fi
