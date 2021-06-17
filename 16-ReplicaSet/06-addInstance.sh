. ./comm.sh

mysqlsh --uri=rsadmin:rspass@$HOSTNAME:3310 << EOL

var x = dba.getReplicaSet()
x.addInstance('rsadmin:rspass@$HOSTNAME:3320', {recoveryMethod:'Incremental'})
x.addInstance('rsadmin:rspass@$HOSTNAME:3330', {recoveryMethod:'Incremental'})
EOL

./status.sh
