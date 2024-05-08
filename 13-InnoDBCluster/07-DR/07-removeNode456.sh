. ./comm.sh

mysqlsh  --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3360');"
mysqlsh  --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3350');"
mysqlsh  --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3340');"
