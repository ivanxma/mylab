. ./comm.sh

mysqlrouter --bootstrap gradmin:grpass@$CLUSTER_HOST:3310 --account routeruser --force --directory config/myrouter

if [ -d config/myrouter ]
then
	echo "stopping router...."
	./config/myrouter/stop.sh
	echo "starting router...."
	./config/myrouter/start.sh
fi
