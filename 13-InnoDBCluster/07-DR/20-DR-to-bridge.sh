. ./comm.sh

# make sure the route is setup and started up
#
#
mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3306   << EOF
stop replica for channel '$BRIDGE_DRCHANNEL';
reset replica for channel '$BRIDGE_DRCHANNEL';
EOF
mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3316   << EOF
stop replica for channel '$BRIDGE_DRCHANNEL';
reset replica for channel '$BRIDGE_DRCHANNEL';
EOF

mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3306 << EOL

set global super_read_only=0;
set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3340, '', 50);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3350, '', 80);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3360, '', 90);

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOL

mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3316 << EOL

set global super_read_only=0;
set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3340, '', 50);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3350, '', 90);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3360, '', 80);

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;


EOL



mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3306   << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$SECONDARY_HOST',
  source_port = 3350,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1,
  SOURCE_RETRY_COUNT=3,
  SOURCE_CONNECT_RETRY=5
FOR CHANNEL '$BRIDGE_DRCHANNEL';


-- set persist super_read_only=1;

-- Start Slave only for testing or DR activated
-- During operation, primary node in InnoDB Cluster MUST NOT be started
START REPLICA FOR CHANNEL '$BRIDGE_DRCHANNEL';
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_DRCHANNEL'\G


EOF
mysql -ugradmin -pgrpass -h$BRIDGE_HOST -P3316   << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$SECONDARY_HOST',
  source_port = 3360,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1,
  SOURCE_RETRY_COUNT=3,
  SOURCE_CONNECT_RETRY=5
FOR CHANNEL '$BRIDGE_DRCHANNEL';


-- set persist super_read_only=1;

-- Start Slave only for testing or DR activated
-- During operation, primary node in InnoDB Cluster MUST NOT be started
START REPLICA FOR CHANNEL '$BRIDGE_DRCHANNEL';
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_DRCHANNEL'\G


EOF

