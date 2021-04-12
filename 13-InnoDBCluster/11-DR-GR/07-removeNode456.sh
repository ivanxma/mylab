. ./comm.sh

mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3360');"
mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3350');"
mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "dba.getCluster().removeInstance('$SECONDARY:3340');"
