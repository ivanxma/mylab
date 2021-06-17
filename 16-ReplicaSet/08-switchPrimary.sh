mysql -uroot -h127.0.0.1 -P3310 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=0"
mysql -uroot -h127.0.0.1 -P3320 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=0"
mysql -uroot -h127.0.0.1 -P3330 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=0"

mysqlsh --uri rsadmin:rspass@$HOSTNAME:3310 << EOL
var rs = dba.getReplicaSet();
rs.setPrimaryInstance("$HOSTNAME:$1")
EOL

if [ "$1" == "3310" ]
then
mysql -uroot -h127.0.0.1 -P3310 -e " set @@global.rpl_semi_sync_master_enabled=1; set @@global.rpl_semi_sync_slave_enabled=0"
mysql -uroot -h127.0.0.1 -P3320 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
mysql -uroot -h127.0.0.1 -P3330 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
fi
if [ "$1" == "3320" ]
then
mysql -uroot -h127.0.0.1 -P3320 -e " set @@global.rpl_semi_sync_master_enabled=1; set @@global.rpl_semi_sync_slave_enabled=0"
mysql -uroot -h127.0.0.1 -P3310 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
mysql -uroot -h127.0.0.1 -P3330 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
fi
if [ "$1" == "3330" ]
then
mysql -uroot -h127.0.0.1 -P3330 -e " set @@global.rpl_semi_sync_master_enabled=1; set @@global.rpl_semi_sync_slave_enabled=0"
mysql -uroot -h127.0.0.1 -P3310 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
mysql -uroot -h127.0.0.1 -P3320 -e " set @@global.rpl_semi_sync_master_enabled=0; set @@global.rpl_semi_sync_slave_enabled=1"
fi

