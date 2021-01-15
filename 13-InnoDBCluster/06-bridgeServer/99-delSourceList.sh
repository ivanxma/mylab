. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOF
set sql_log_bin=0;
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3310, '');
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '');
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '');

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOF

mysql -uroot -h127.0.0.1 -P3316 << EOF
set sql_log_bin=0;
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3310, '');
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '');
SELECT asynchronous_connection_failover_delete_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '');

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOF
