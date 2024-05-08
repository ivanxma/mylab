. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$SECONDARY_HOST:3340 -e "
var  x = dba.getCluster('mycluster')
x.dissolve({force:true, interactive:false})
"
