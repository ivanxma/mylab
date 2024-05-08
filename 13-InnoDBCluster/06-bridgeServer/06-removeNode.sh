. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 << EOL

var x = dba.getCluster()
x.removeInstance('$BRIDGE_HOST:3306')
x.removeInstance('$BRIDGE_HOST:3316')

x.status()
EOL
