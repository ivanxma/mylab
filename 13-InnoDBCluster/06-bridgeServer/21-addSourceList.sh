. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL

set global super_read_only=0;
set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3310, '', 50);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '', 80);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '', 90);

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOL

mysql -uroot -h127.0.0.1 -P3316 << EOL

set global super_read_only=0;
set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3310, '', 50);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '', 90);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '', 80);

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOL
