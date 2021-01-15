. ./comm.sh
mysql -uroot -h127.0.0.1 -P3316 << EOL3316
reset master;
reset slave;
EOL3316

mysql -uroot -h127.0.0.1 -P3326 << EOL3326
reset master;
reset slave;
EOL3326

mysql -uroot -h127.0.0.1 -P3326 << EOL1

change master to
master_host='127.0.0.1',
master_user='repl',
master_password='repl',
master_port=3316,
master_auto_position=1
for channel 'channel1';

start slave for channel 'channel1';

show slave status for channel 'channel1'\G
EOL1


