. ./comm.sh

mysqlsh --uri=rsadmin:rspass@$HOSTNAME:3310 << EOL
var x = dba.getReplicaSet()
print(x.status())
EOL
