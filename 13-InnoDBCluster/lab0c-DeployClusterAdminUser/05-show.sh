. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3310 -pwelcome1 << EOL
show variables like 'replica_parallel%';
show variables like 'group_replication%';
EOL
