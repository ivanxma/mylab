
. ./comm.sh

echo "Start - Shutting Down 3310,3320 and 3330"

mysql -uroot -h127.0.0.1 -P3310 -e "shutdown;"
mysql -uroot -h127.0.0.1 -P3320 -e "shutdown;"
mysql -uroot -h127.0.0.1 -P3330 -e "shutdown;"

while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	sleep 1
done
echo "Finished - Shutting Down 3310,3320 and 3330"

echo "Start - Restarting 3310, 3320 and 3330 without loading persisted variables"
./92-startdb-nogr.sh


sleep 10

mysqlsh --uri gradmin:grpass@primary:3310 -e " \
  dba.rebootClusterFromCompleteOutage('mycluster', { \
    clearReadOnly:true});"
