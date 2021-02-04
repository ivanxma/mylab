. ./comm.sh

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3360');"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3350');"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "dba.getCluster().removeInstance('$SECONDARY_HOST:3340');"
