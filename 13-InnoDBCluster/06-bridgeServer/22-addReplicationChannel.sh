. ./comm.sh

# make sure the route is setup and started up
#
# persist REPLICATION FILTER in config file
#
#    SOURCE_CONNECTION_AUTO_FAILOVER : activates the asynchronous connection failover mechanism.
#    MASTER_RETRY_COUNT & MASTER_CONNECT_RETRY : define the failover time. The default setting is… 60 days, probably not what you want :). So, you (most likely) should reduced the settings. e.g. 1 minute is respectively 20 and 3. (20 x 3 = 60)
#     FOR CHANNEL : enables you to name which replication channel the statement applies to. The CHANGE MASTER TO statement applies to this specific replication channel.

mysql -uroot -h127.0.0.1 -P3306  << EOF

CHANGE MASTER TO
  master_host = '$CLUSTER_HOST',
  master_port = 3330,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1, 
  MASTER_RETRY_COUNT=3, 
  MASTER_CONNECT_RETRY=5 
FOR CHANNEL '$BRIDGE_CHANNEL';

CHANGE REPLICATION FILTER
  REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata)
FOR CHANNEL '$BRIDGE_CHANNEL';

set persist super_read_only=1;

START REPLICA FOR CHANNEL '$BRIDGE_CHANNEL';
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G

EOF

mysql -uroot -h127.0.0.1 -P3316  << EOF

CHANGE MASTER TO
  master_host = '$CLUSTER_HOST',
  master_port = 3320,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1, 
  MASTER_RETRY_COUNT=3, 
  MASTER_CONNECT_RETRY=5 
FOR CHANNEL '$BRIDGE_CHANNEL';

CHANGE REPLICATION FILTER
  REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata)
FOR CHANNEL '$BRIDGE_CHANNEL';

set persist super_read_only=1;

START REPLICA FOR CHANNEL '$BRIDGE_CHANNEL';
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G

EOF
