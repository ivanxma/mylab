mysql -uroot -h127.0.0.1 -P3340  << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$CLUSTER_HOST',
  source_port = 3310,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1
FOR CHANNEL 'channel1';

CHANGE REPLICATION FILTER
  REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata)
FOR CHANNEL 'channel1';

START REPLICA FOR CHANNEL 'channel1';

SHOW REPLICA STATUS FOR CHANNEL 'channel1'\G

EOF
