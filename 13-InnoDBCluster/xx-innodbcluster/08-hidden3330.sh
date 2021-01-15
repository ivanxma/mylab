. ./comm.sh
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 << EOL
var  x=dba.getCluster()

x.setInstanceOption('$CLUSTER_HOST:3330', 'tag:_disconnect_existing_sessions_when_hidden', true)
x.setInstanceOption('$CLUSTER_HOST:3330', 'tag:_hidden', true)

x.status()

EOL


