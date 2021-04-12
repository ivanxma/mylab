. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -uroot -h127.0.0.1 -P3340  << EOF

CHANGE MASTER TO
  master_host = '$PRIMARY',
  master_port = 3310,
  master_user = 'repl',
  master_password = 'repl',
  master_auto_position=1
FOR CHANNEL 'channel1';


-- set persist super_read_only=1;
SHOW SLAVE STATUS FOR CHANNEL 'channel1'\G



EOF
