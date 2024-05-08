. ./comm.sh

mysqlsh --js -e "
dba.configureInstance('root:@localhost:3310',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
