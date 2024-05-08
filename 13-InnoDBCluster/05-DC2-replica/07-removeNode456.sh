. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3360');"
mysqlsh --js --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3350');"
mysqlsh --js --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3340');"
