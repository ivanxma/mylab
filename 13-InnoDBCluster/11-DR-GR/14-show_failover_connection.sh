. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3340 << EOL

SELECT * FROM performance_schema.replication_asynchronous_connection_failover_managed;
SELECT * FROM performance_schema.replication_asynchronous_connection_failover;

EOL

