. ./comm.sh

# make sure the route is setup and started up
#
#

mysql -uroot -h127.0.0.1 -P3340  -p << EOF

-- start slave for channel '$BRIDGE_CHANNEL';
-- set persist super_read_only=1;
SHOW REPLICA STATUS FOR CHANNEL '$BRIDGE_CHANNEL'\G

EOF
