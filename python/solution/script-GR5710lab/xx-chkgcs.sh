mysql -uroot -h127.0.0.1 -P$1  << EOL2
SELECT * FROM performance_schema.replication_connection_status\G
SELECT * FROM performance_schema.replication_group_members;
SELECT * FROM performance_schema.replication_group_member_stats\G
EOL2
