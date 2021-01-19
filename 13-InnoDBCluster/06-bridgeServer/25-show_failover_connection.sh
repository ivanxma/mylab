mysql -t -uroot -h127.0.0.1 -P3306 << EOL

SELECT * FROM performance_schema.replication_asynchronous_connection_failover_managed;
SELECT * FROM performance_schema.replication_asynchronous_connection_failover;

EOL
mysql -t -uroot -h127.0.0.1 -P3316 << EOL

SELECT * FROM performance_schema.replication_asynchronous_connection_failover_managed;
SELECT * FROM performance_schema.replication_asynchronous_connection_failover;
EOL

