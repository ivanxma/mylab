. ./comm.sh

echo "Removing replica cluster read replicas"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "
var  x = dba.getCluster('mycluster2')
x.removeInstance('$CLUSTER_HOST:4460')
x.removeInstance('$CLUSTER_HOST:4450')
x.removeInstance('$CLUSTER_HOST:4440')
"
echo "Removing primary cluster read replicas"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "
var  x = dba.getCluster('mycluster')
x.removeInstance('$CLUSTER_HOST:4430')
x.removeInstance('$CLUSTER_HOST:4420')
x.removeInstance('$CLUSTER_HOST:4410')
"

echo "Removing replica cluster "
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "
var  x = dba.getClusterSet()
x.removeCluster('mycluster2')
"
echo "Removing primary cluster "
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "
var  x = dba.getCluster('mycluster')
x.dissolve({force:true})
"
