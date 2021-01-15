. ./comm.sh

pkill -9 mysqlrouter

sleep 2
rm -rf config/myrouter
mysqlrouter --bootstrap gradmin:grpass@$SECONDARY_HOST:3310 --account userx --account-create never --force --directory config/myrouter << EOL
userx
EOL

if [ -d config/myrouter ]
then
	echo "stopping router...."
	./config/myrouter/stop.sh
	echo "starting router...."
	./config/myrouter/start.sh
fi
