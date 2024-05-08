. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -uroot -h127.0.0.1 -P3340  << EOF

start replica for channel 'channel1';

-- set persist super_read_only=1;
SHOW REPLICA STATUS FOR CHANNEL 'channel1'\G



EOF
