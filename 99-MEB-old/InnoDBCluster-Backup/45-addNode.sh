. ./comm.sh
DEST=/home/mysql/backup/full/3326

mysqlsh --uri gradmin:grpass@primary:3306 << EOL
var x = dba.getCluster('mycluster')
print(x.status())
x.addInstance('gradmin:grpass@primary:3426')
print(x.status())
EOL




