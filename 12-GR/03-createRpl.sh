. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -e "create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3306 -e "change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3306 -e "reset master;reset slave;"

mysql -uroot -h127.0.0.1 -P3316 -e "create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3316 -e "change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3316 -e "reset master;reset slave;"

mysql -uroot -h127.0.0.1 -P3326 -e "create user rpl_user@'%' identified with mysql_native_password by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3326 -e "change master to master_user='rpl_user', master_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3326 -e "reset master;reset slave;"
