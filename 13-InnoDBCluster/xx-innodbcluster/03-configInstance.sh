. ./comm.sh

mysqlsh -e "
dba.configureInstance('root:@localhost:3310',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:3320',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:3330',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
