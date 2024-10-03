
. ./comm.sh

echo "Start - Shutting Down read-replicas and their clusters 3310, 3320, 3330, 3340, 3350 and 3360"

for i in 4460 4450 4440 4430 4420 4410; 
do 
mysql -uroot -h 127.0.0.1 -P $i -e "shutdown;"
done
for i in 3360 3350 3340 3330 3320 3310; 
do 
mysql -uroot -h 127.0.0.1 -P $i -e "set persist group_replication_start_on_boot=OFF; shutdown;"
done

while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	sleep 1
done
echo "Finshed shutting down 4460, 4450, 4440, 4430, 4420, 4410, 3360, 3350, 3340, 3330, 3320 and 3310"

echo "Start - Restarting 3310, 3320 and 3330 without loading persisted variables"
./92-startdb-nogr.sh
./92-startdb-nogr.sh 4 
./92-startdb-nogr.sh 5
./92-startdb-nogr.sh 6

sleep 10

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e "dba.rebootClusterFromCompleteOutage('mycluster')"
./xx-startdb.sh 11
./xx-startdb.sh 22 
./xx-startdb.sh 33
sleep 5
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 --js -e " 
 x = dba.getCluster('mycluster')
 x.rejoinInstance('$CLUSTER_HOST:4410',{timeout:10})
 x.rejoinInstance('$CLUSTER_HOST:4420',{timeout:10})
 x.rejoinInstance('$CLUSTER_HOST:4430',{timeout:10})
"

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "dba.rebootClusterFromCompleteOutage('mycluster2');"
./xx-startdb.sh 44
./xx-startdb.sh 55 
./xx-startdb.sh 66
sleep 5
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3340 --js -e "  
 y = dba.getCluster('mycluster2')
 y.rejoinInstance('$CLUSTER_HOST:4440',{timeout:10})
 y.rejoinInstance('$CLUSTER_HOST:4450',{timeout:10})
 y.rejoinInstance('$CLUSTER_HOST:4460',{timeout:10})
"
