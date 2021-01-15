. ./comm.sh

mysql -uroot -h127.0.0.1 -P3326 << EOL
use performance_schema;
select * from replication_connection_configuration\G
select * from replication_connection_status\G
EOL
