mysql -uroot -h127.0.0.1 -P3340  << EOF

CHANGE MASTER TO
  master_host = '$CLUSTER_HOST',
  master_port = 3310,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1
FOR CHANNEL 'channel1';

CHANGE REPLICATION FILTER
  REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata)
FOR CHANNEL 'channel1';

START SLAVE FOR CHANNEL 'channel1';

SHOW SLAVE STATUS FOR CHANNEL 'channel1'\G

EOF
