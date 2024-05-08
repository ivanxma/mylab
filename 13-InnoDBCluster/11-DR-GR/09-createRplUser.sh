. ./comm.sh
mysql -uroot -h127.0.0.1 -P3340 -e "set global super_read_only=off;set sql_log_bin=off;create user if not exists rpl_user@'%' identified by 'rpl_pass' REQUIRE SSL;grant  replication slave, BACKUP_ADMIN, CLONE_ADMIN on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3340 -e "set sql_log_bin=off;change REPLICATION SOURCE TO source_user='rpl_user', source_password='rpl_pass'  for channel 'group_replication_recovery';"

mysql -uroot -h127.0.0.1 -P3350 -e "set global super_read_only=off;set sql_log_bin=off;create user if not exists rpl_user@'%' identified by 'rpl_pass' REQUIRE SSL;grant replication slave, BACKUP_ADMIN, CLONE_ADMIN on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3350 -e "set sql_log_bin=off;change REPLICATION SOURCE TO source_user='rpl_user', source_password='rpl_pass' for channel 'group_replication_recovery';"

mysql -uroot -h127.0.0.1 -P3360 -e "set global super_read_only=off;set sql_log_bin=off;create user if not exists rpl_user@'%' identified by 'rpl_pass' REQUIRE SSL;grant replication slave, BACKUP_ADMIN, CLONE_ADMIN on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3360 -e "set sql_log_bin=off;change REPLICATION SOURCE TO source_user='rpl_user', source_password='rpl_pass' for channel 'group_replication_recovery';"
