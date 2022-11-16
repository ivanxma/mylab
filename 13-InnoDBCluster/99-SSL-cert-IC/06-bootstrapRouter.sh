. ./comm.sh

rm -rf config/myrouter


mysqlrouter --bootstrap gradmin:grpass@$CLUSTER_HOST:3310 --force --directory config/myrouter
