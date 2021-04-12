. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -ugradmin -pgrpass -h$PRIMARY -P3310  << EOF

start replica for channel 'channel1';

-- set persist super_read_only=1;
SHOW SLAVE STATUS FOR CHANNEL 'channel1'\G



EOF
