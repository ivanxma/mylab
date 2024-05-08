. ./comm.sh

mysqlsh --js -e "
dba.configureInstance('root:@localhost:3340',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});"
mysqlsh --js -e "
dba.configureInstance('root:@localhost:3350',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});"
mysqlsh --js -e "
dba.configureInstance('root:@localhost:3360',{clusterAdmin:'gradmin',clusterAdminPassword:'grpass'});"
