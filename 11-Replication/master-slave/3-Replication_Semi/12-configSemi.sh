. ./comm.sh
mysql -uroot -h127.0.0.1 -P3316 << EOL
SET GLOBAL rpl_semi_sync_master_enabled = 1;
SET GLOBAL rpl_semi_sync_master_timeout = 9999999;
EOL
mysql -uroot -h127.0.0.1 -P3326 << EOL2
stop SLAVE IO_THREAD;

SET GLOBAL rpl_semi_sync_slave_enabled = 1;
start SLAVE IO_THREAD;
EOL2
