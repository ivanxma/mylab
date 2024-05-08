. ./comm.sh

mysqlsh --js --uri=rsadmin:rspass@$HOSTNAME:3310 << EOL
var x = dba.getReplicaSet()
print(x.status())
EOL
