. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -uroot -h127.0.0.1 -P3340  << EOF

CHANGE REPLICATION SOURCE TO
  source_host = 'primary',
  source_port = 3306,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1
FOR CHANNEL 'channel1';


-- set persist super_read_only=1;
SHOW REPLICA STATUS FOR CHANNEL 'channel1'\G

EOF
