. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3310 -pwelcome1 << EOL
show variables like 'slave_parallel%';
show variables like 'group_replication%';
EOL
