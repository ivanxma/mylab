. ./comm.sh

mysqlsh --js -e "
dba.configureInstance('root:@localhost:4410',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:4420',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:4430',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
