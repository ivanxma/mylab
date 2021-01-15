. ./comm.sh

mysqlsh --uri gradmin:grpass@primary:3306 -e "print(dba.getCluster('mycluster').status())"
