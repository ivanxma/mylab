. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -ugradmin -pgrpass -h$CLUSTER_HOST -P3310   << EOF
stop replica for channel '$BRIDGE_CHANNEL';
reset replica for channel '$BRIDGE_CHANNEL';
EOF

mysql -ugradmin -pgrpass -h$CLUSTER_HOST -P3310   << EOF

set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$BRIDGE_HOST', 3306, '', 50);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$BRIDGE_HOST', 3316, '', 80);
SELECT * FROM performance_schema.replication_asynchronous_connection_failover;

EOF

mysql -ugradmin -pgrpass -h$CLUSTER_HOST -P3310   << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$BRIDGE_HOST',
  source_port = 3306,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1,
  SOURCE_RETRY_COUNT=3,
  SOURCE_CONNECT_RETRY=5
FOR CHANNEL '$BRIDGE_CHANNEL';


-- set persist super_read_only=1;

-- Start Slave only for testing or DR activated
-- During operation, primary node in InnoDB Cluster MUST NOT be started
START REPLICA FOR CHANNEL '$BRIDGE_CHANNEL';
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G


EOF
