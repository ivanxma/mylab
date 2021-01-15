. ./comm.sh

mysqlsh --uri gradmin:grpass@primary:3306 << EOL
dba.createCluster('mycluster')
var x = dba.getCluster('mycluster')

x.addInstance('gradmin:grpass@primary:3316')
x.addInstance('gradmin:grpass@primary:3326')
print(x.status())
EOL
