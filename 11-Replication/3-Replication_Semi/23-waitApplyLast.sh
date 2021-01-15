. ./comm.sh
mysql -uroot -h127.0.0.1 -P3326 << EOL2
start SLAVE SQL_THREAD;
SELECT WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS(received_transaction_set, 0, 'channel1') 
from performance_schema.replication_connection_status
where channel_name = 'channel1';
;

EOL2

./07-showdata.sh
