. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306  << EOL1
reset master;
reset slave;
SET GLOBAL group_replication_group_name= "8a94f357-aab4-11df-86ab-c80aa9429562";
SET GLOBAL group_replication_recovery_retry_count= 2;
SET GLOBAL group_replication_recovery_reconnect_interval=120;
SET GLOBAL group_replication_local_address="primary:4306";
SET GLOBAL group_replication_peer_addresses="primary:4306,primary:4316";
set GLOBAL group_replication_bootstrap_group=1;
START GROUP_REPLICATION;
show warnings;
EOL1


mysql -uroot -h127.0.0.1 -P3316  << EOL2
reset master;
reset slave;
SET GLOBAL group_replication_group_name= "8a94f357-aab4-11df-86ab-c80aa9429562";
SET GLOBAL group_replication_recovery_retry_count= 2;
SET GLOBAL group_replication_recovery_reconnect_interval=120;
SET GLOBAL group_replication_local_address="primary:4316";
SET GLOBAL group_replication_peer_addresses="primary:4306,primary:4316";
START GROUP_REPLICATION;
show warnings;
EOL2

echo "Press <ENTER> to show status of server 1 - 3306"
read
./xx-chkgcs.sh 3306
echo "Press <ENTER> to show status of server 2 - 3316"
read
./xx-chkgcs.sh 3316
