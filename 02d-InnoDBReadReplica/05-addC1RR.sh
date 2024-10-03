. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4410',
 { label:'RReplica1',
   replicationSources: ['$CLUSTER_HOST:3310'],
   recoveryMethod: 'clone'
 } 
)
print(x.status())
"

sleep 5

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4420',
 { label:'RReplica2',
   replicationSources: ['$CLUSTER_HOST:3320','$CLUSTER_HOST:3330'],
   recoveryMethod: 'clone',
   cloneDonor: '$CLUSTER_HOST:3330'
 } 
)
print(x.status())
"

sleep 5

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "

var x = dba.getCluster()
x.addReplicaInstance(
 '$CLUSTER_HOST:4430',
 { label:'RReplica3',
   replicationSources: 'secondary',
   recoveryMethod: 'clone',
   cloneDonor: '$CLUSTER_HOST:3330'
 } 
)
print(x.status())
"

