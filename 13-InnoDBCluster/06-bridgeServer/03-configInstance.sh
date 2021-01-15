. ./comm.sh

mysqlsh -e "
dba.configureInstance('root:@localhost:3306',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
mysqlsh -e "
dba.configureInstance('root:@localhost:3316',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
