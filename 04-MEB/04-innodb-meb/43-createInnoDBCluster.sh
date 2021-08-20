. ./comm.sh

mysqlsh --uri gradmin:grpass@${PRIMARY_HOST}:3306 << EOL
dba.createCluster('mycluster')
var x = dba.getCluster('mycluster')

x.addInstance('gradmin:grpass@${PRIMARY_HOST}:3316')
x.addInstance('gradmin:grpass@${PRIMARY_HOST}:3326')
print(x.status())
EOL
