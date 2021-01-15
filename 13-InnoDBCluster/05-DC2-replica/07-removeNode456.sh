. ./comm.sh

mysqlsh --uri gradmin:grpass@primary:3310 -e "dba.getCluster().removeInstance('secondary:3360');"
mysqlsh --uri gradmin:grpass@primary:3310 -e "dba.getCluster().removeInstance('secondary:3350');"
mysqlsh --uri gradmin:grpass@primary:3310 -e "dba.getCluster().removeInstance('secondary:3340');"
