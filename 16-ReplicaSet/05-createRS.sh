. ./comm.sh

mysqlsh --uri=rsadmin:rspass@primary:3310 << EOL

var x = dba.createReplicaSet('myrs')
EOL

./status.sh


