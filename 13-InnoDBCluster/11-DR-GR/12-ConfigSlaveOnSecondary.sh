. ./comm.sh

# make sure the route is setup and started up
#
#

mysqlsh --uri gradmin:grpass@$PRIMARY:3310 << EOL

var v = session.runSql('select @@group_replication_group_name;').fetchAll();
var gname = v[0][0];

print("Group Replication Grouop Name : " + gname + "\n");

var sess3340 = shell.connect("root:@127.0.0.1:3340")
sess3340.runSql(" set global super_read_only=0; ")
sess3340.runSql(" set sql_log_bin=0; ")

sess3340.runSql(" SELECT asynchronous_connection_failover_delete_managed('channel1', '" + gname + "');")

sess3340.runSql("SELECT asynchronous_connection_failover_add_managed('channel1', 'GroupReplication', '" + gname + "', '$PRIMARY', 3310, '', 80, 60); ")


EOL

mysql -uroot -h127.0.0.1 -P3340  << EOF

CHANGE REPLICATION SOURCE TO
  source_host = '$PRIMARY',
  source_port = 3310,
  source_user = 'repl',
  source_password = 'repl',
  source_ssl = 1,
  source_auto_position=1,
  SOURCE_CONNECTION_AUTO_FAILOVER=1, 
  SOURCE_RETRY_COUNT=3, 
  SOURCE_CONNECT_RETRY=5 
FOR CHANNEL 'channel1';


-- set persist super_read_only=1;
SHOW REPLICA STATUS FOR CHANNEL 'channel1'\G



EOF
