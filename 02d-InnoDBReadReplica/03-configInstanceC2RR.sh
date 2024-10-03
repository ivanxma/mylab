. ./comm.sh

mysqlsh --js -e "
dba.configureInstance('root:@localhost:4440',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:4450',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
dba.configureInstance('root:@localhost:4460',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
