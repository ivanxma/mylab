. ./comm.sh
mysql -uroot -h127.0.0.1 -P3340 -e "set global super_read_only=off;set sql_log_bin=off;create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3340 -e "set sql_log_bin=off;change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"

mysql -uroot -h127.0.0.1 -P3350 -e "set global super_read_only=off;set sql_log_bin=off;create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3350 -e "set sql_log_bin=off;change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"

mysql -uroot -h127.0.0.1 -P3360 -e "set global super_read_only=off;set sql_log_bin=off;create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3360 -e "set sql_log_bin=off;change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"
