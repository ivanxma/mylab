. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 << EOL

var x = dba.getCluster()
x.removeInstance('$CLUSTER_HOST:3306')

x.status()
EOL
