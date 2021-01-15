. ./comm.sh

mysql -uroot -h127.0.0.1 -P3310 -e "
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_master_enabled,@@global.rpl_semi_sync_master_timeout;
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_slave_enabled;
"
mysql -uroot -h127.0.0.1 -P3320 -e "
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_master_enabled,@@global.rpl_semi_sync_master_timeout;
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_slave_enabled;
"
mysql -uroot -h127.0.0.1 -P3330 -e "
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_master_enabled,@@global.rpl_semi_sync_master_timeout;
select @@hostname, @@port, @@read_only, @@global.rpl_semi_sync_slave_enabled;
"


