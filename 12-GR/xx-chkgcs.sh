. ./comm.sh
if [ $# -eq 2 ] 
then
mysql -t -uroot -h127.0.0.1 -P$1 -p$2 << EOL1
SELECT * FROM performance_schema.replication_connection_status\G
SELECT * FROM performance_schema.replication_group_members;
SELECT * FROM performance_schema.replication_group_member_stats\G
select * from performance_schema.replication_applier_status_by_worker;
EOL1
else
mysql -t -uroot -h127.0.0.1 -P$1  << EOL2
SELECT * FROM performance_schema.replication_connection_status\G
SELECT * FROM performance_schema.replication_group_members;
SELECT * FROM performance_schema.replication_group_member_stats\G
select * from performance_schema.replication_applier_status_by_worker;
EOL2
fi
