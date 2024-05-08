. ./comm.sh

mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 << EOL

var v = session.runSql('select @@group_replication_group_name;').fetchAll();
var gname = v[0][0];

print("Group Replication Grouop Name : " + gname + "\n");

var sess3306 = shell.connect("root:@127.0.0.1:3306")
sess3306.runSql(" set global super_read_only=0; ")
sess3306.runSql(" set sql_log_bin=0; ")
sess3306.runSql(" SELECT asynchronous_connection_failover_delete_managed('$BRIDGE_CHANNEL', '" + gname + "');")
sess3306.close();
var sess3316 = shell.connect("root:@127.0.0.1:3316")
sess3316.runSql(" set global super_read_only=0; ")
sess3316.runSql(" set sql_log_bin=0; ")
sess3316.runSql(" SELECT asynchronous_connection_failover_delete_managed('$BRIDGE_CHANNEL', '" + gname + "');")
sess3316.close();

EOL
