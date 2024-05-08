. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
var  x = dba.getCluster('mycluster')
x.dissolve({force:true, interactive:false})
"
