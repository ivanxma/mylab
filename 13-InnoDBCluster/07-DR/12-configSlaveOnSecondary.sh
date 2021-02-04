. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -uroot -h127.0.0.1 -P3340  -p << EOF

set sql_log_bin=0;
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3306, '', 90);
SELECT asynchronous_connection_failover_add_source('$BRIDGE_DRCHANNEL', '$SECONDARY_HOST', 3316, '', 50);

SELECT * FROM performance_schema.replication_asynchronous_connection_failover;

EOF

mysql -uroot -h127.0.0.1 -P3340  -p << EOF

CHANGE REPLICATION SOURCE TO
  master_host = '$BRIDGE_HOST',
  master_port = 3306,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1,
  SOURCE_RETRY_COUNT=3,
  SOURCE_CONNECT_RETRY=5
FOR CHANNEL '$BRIDGE_CHANNEL';


-- set persist super_read_only=1;
START REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G

EOF
