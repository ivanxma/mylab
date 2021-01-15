. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P$1  << EOL2

SELECT member_host, member_port, member_state FROM performance_schema.replication_group_members;
EOL2
