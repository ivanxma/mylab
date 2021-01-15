. ./comm.sh

mysqlsh --uri gradmin:grpass@primary:3306 -e "dba.rebootClusterFromCompleteOutage('mycluster')"
