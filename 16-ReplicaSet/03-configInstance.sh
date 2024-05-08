. ./comm.sh

mysqlsh --js -e "
dba.configureReplicaSetInstance('root:@localhost:3310',{clusterAdmin:'rsadmin',clusterAdminPassword:'rspass'});
dba.configureReplicaSetInstance('root:@localhost:3320',{clusterAdmin:'rsadmin',clusterAdminPassword:'rspass'});
dba.configureReplicaSetInstance('root:@localhost:3330',{clusterAdmin:'rsadmin',clusterAdminPassword:'rspass'});
"
