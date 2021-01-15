. ./comm.sh

mysqlsh --uri=rsadmin:rspass@primary:3310 << EOL
var x = dba.getReplicaSet()
print(x.status())
EOL
