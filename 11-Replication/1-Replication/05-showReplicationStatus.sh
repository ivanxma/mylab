. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3316 << EOL3316
select @@hostname, @@port;
show master status\G
show replica status for channel 'channel1'\G
EOL3316

mysql -t -uroot -h127.0.0.1 -P3326 << EOL3326
select @@hostname, @@port;
show master status\G
show replica status for channel 'channel1'\G
EOL3326



