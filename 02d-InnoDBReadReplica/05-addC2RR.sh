. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4440',
 { label:'RReplica4',
   replicationSources: 'primary',
   recoveryMethod: 'clone',
   cloneDonor: '$CLUSTER_HOST:3340'
 } 
)
print(x.status())
"
sleep 5
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4450',
 { label:'RReplica5',
   replicationSources: 'primary',
   recoveryMethod: 'clone',
   cloneDonor: '$CLUSTER_HOST:3340'
 } 
)
print(x.status())
"
sleep 5
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4460',
 { label:'RReplica6',
   replicationSources: 'primary',
   recoveryMethod: 'clone',
   cloneDonor: '$CLUSTER_HOST:3340'
 } 
)
print(x.status())
"


