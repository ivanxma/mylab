. ./comm.sh
mysql -uroot -h127.0.0.1 -P3310 << EOL
SET GLOBAL rpl_semi_sync_master_enabled = 1;
SET GLOBAL rpl_semi_sync_master_timeout = 9999999;
set GLOBAL rpl_semi_sync_master_wait_for_slave_count=2;
EOL

mysql -uroot -h127.0.0.1 -P3320 << EOL2
SET GLOBAL rpl_semi_sync_master_enabled = 0;
stop SLAVE IO_THREAD;

SET GLOBAL rpl_semi_sync_slave_enabled = 1;
start SLAVE IO_THREAD;
EOL2

mysql -uroot -h127.0.0.1 -P3330 << EOL3
SET GLOBAL rpl_semi_sync_master_enabled = 0;
stop SLAVE IO_THREAD;

SET GLOBAL rpl_semi_sync_slave_enabled = 1;
start SLAVE IO_THREAD;
EOL3
