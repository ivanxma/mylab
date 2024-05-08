. ./comm.sh

mysqlsh --js -i --uri root:welcome1@localhost:3310  -e "
 dba.getCluster().status();
"
