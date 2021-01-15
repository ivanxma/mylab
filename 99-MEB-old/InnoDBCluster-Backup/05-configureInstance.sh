. ./comm.sh

mysqlsh  -e "dba.configureInstance('root:mysql@127.0.0.1:3306', {clusterAdmin:'gradmin', clusterAdminPassword:'grpass'})"
