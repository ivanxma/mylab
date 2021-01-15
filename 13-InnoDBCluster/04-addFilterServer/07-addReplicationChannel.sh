. ./comm.sh

# make sure the route is setup and started up
#
# persist REPLICATION FILTER in config file
#

mysql -uroot -h127.0.0.1 -P3306  << EOF

CHANGE MASTER TO
  master_host = '$CLUSTER_HOST',
  master_port = 6446,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1
FOR CHANNEL 'channel1';

CHANGE REPLICATION FILTER
  REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata)
FOR CHANNEL 'channel1';

set persist super_read_only=1;

START SLAVE FOR CHANNEL 'channel1';
SHOW SLAVE STATUS FOR CHANNEL 'channel1'\G

EOF
