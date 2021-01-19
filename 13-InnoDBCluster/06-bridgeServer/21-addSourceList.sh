. ./comm.sh

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 << EOL

var v = session.runSql('select @@group_replication_group_name;').fetchAll();
var gname = v[0][0];

print("Group Replication Grouop Name : " + gname + "\n");

var sess3306 = shell.connect("root:@127.0.0.1:3306")
sess3306.runSql(" set global super_read_only=0; ")
sess3306.runSql(" set sql_log_bin=0; ")

sess3306.runSql(" SELECT asynchronous_connection_failover_delete_managed('$BRIDGE_CHANNEL', '" + gname + "');")

sess3306.runSql("SELECT asynchronous_connection_failover_add_managed('$BRIDGE_CHANNEL', 'GroupReplication', '" + gname + "', '$CLUSTER_HOST', 3310, '', 80, 60); ")
sess3306.runSql("SELECT asynchronous_connection_failover_add_managed('$BRIDGE_CHANNEL', 'GroupReplication', '" + gname + "', '$CLUSTER_HOST', 3320, '', 80, 60); ")
sess3306.runSql("SELECT asynchronous_connection_failover_add_managed('$BRIDGE_CHANNEL', 'GroupReplication', '" + gname + "', '$CLUSTER_HOST', 3330, '', 80, 60); ")

// sess3306.runSql(" SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '', 90);")
// sess3306.runSql(" SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '', 80);")
EOL



mysql -t -uroot -h127.0.0.1 -P3306 << EOL

SELECT * FROM performance_schema.replication_asynchronous_connection_failover_managed;
SELECT * FROM performance_schema.replication_asynchronous_connection_failover;

EOL

#mysql -uroot -h127.0.0.1 -P3316 << EOL

#set global super_read_only=0;
#set sql_log_bin=0;
#SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3310, '', 50);
#SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3320, '', 90);
#SELECT asynchronous_connection_failover_add_source('$BRIDGE_CHANNEL', '$CLUSTER_HOST', 3330, '', 80);
#
#SELECT * FROM performance_schema.replication_asynchronous_connection_failover;
#

#EOL
