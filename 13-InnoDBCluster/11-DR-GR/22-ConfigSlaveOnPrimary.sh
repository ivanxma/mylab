. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -ugradmin  -pgrpass -h$PRIMARY  -P3310  << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$SECONDARY',
  source_port = 3340,
  source_user = 'repl',
  source_password = 'repl',
  source_auto_position=1
FOR CHANNEL 'channel1';


-- set persist super_read_only=1;
SHOW REPLICA STATUS FOR CHANNEL 'channel1'\G



EOF
