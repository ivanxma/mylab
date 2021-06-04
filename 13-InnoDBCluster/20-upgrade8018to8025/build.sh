#pkill -9 mysqld
#pkill -9 mysqlrouter
sleep 5
./01-init.sh
./02-startdb.sh
sleep 10
./03-configInstance.sh
./05a-createCluster.sh
./05b-addIncremental.sh
./05c-addClone.sh

