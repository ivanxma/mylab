. ./comm.sh

mysqlsh --uri gradmin:grpass@${PRIMARY_HOST}:3306 -e "dba.rebootClusterFromCompleteOutage('mycluster')"
