. ./comm.sh

mysqlsh --js -e "
dba.configureInstance('root:@localhost:3306',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});
"
