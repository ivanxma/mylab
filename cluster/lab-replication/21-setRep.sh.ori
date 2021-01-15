. ./comm.sh
typeset -i MYPORT
MYPORT=$MYPORT+10
echo "Next Port = $MYPORT"
echo $MYPORT > myport.txt

NXTID=`mcm << EOL1 |grep mysqld|cut -f3
list nextnodeids mycluster1;
EOL1`

echo "Next ID = $NXTID"

mcm << EOL

add process  -R mysqld@$PRIMARY mycluster1;
add process  -R mysqld@$SECONDARY mycluster2;

set port:mysqld:${NXTID}=${MYPORT} mycluster1;
set port:mysqld:${NXTID}=${MYPORT} mycluster2;

set log-bin:mysqld:${NXTID}=mycluster,binlog-format:mysqld:${NXTID}=ROW,log-slave-updates:mysqld:${NXTID}=false,ndb-log-updated-only:mysqld:${NXTID}=true,server-id:mysqld:${NXTID}=101,ndb-cluster-connection-pool:mysqld:${NXTID}=2,ndb-batch-size:mysqld:${NXTID}=32768,ndb_log_update_as_write:mysqld:${NXTID}=OFF,ndb_log_apply_status:mysqld:${NXTID}=true,ndb_log_transaction_id:mysqld:${NXTID}=1,skip_slave_start:mysqld:${NXTID}=true mycluster1;

set log-bin:mysqld:${NXTID}=mycluster,binlog-format:mysqld:${NXTID}=ROW,log-slave-updates:mysqld:${NXTID}=false,ndb-log-updated-only:mysqld:${NXTID}=true,server-id:mysqld:${NXTID}=102,ndb-cluster-connection-pool:mysqld:${NXTID}=2,ndb-batch-size:mysqld:${NXTID}=32768,ndb_log_update_as_write:mysqld:${NXTID}=OFF,ndb_log_apply_status:mysqld:${NXTID}=true,ndb_log_transaction_id:mysqld:${NXTID}=1,skip_slave_start:mysqld:${NXTID}=true mycluster2;

get -d port:mysqld mycluster1;
get -d port:mysqld mycluster2;

show status -r mycluster1;
show status -r mycluster2;

EOL
