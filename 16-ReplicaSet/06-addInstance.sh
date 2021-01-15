. ./comm.sh

mysqlsh --uri=rsadmin:rspass@primary:3310 << EOL

var x = dba.getReplicaSet()
x.addInstance('rsadmin:rspass@primary:3320', {recoveryMethod:'Incremental'})
x.addInstance('rsadmin:rspass@primary:3330', {recoveryMethod:'Incremental'})
EOL

./status.sh
