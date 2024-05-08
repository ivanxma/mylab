. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -e "create user if not exists rpl_user@'%' identified  by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3306 -e "change replication source to source_user='rpl_user', source_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3306 -e "RESET BINARY LOGS AND GTIDS; reset replica;"

mysql -uroot -h127.0.0.1 -P3316 -e "create user if not exists rpl_user@'%' identified  by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3316 -e "change replication source to source_user='rpl_user', source_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3316 -e "RESET BINARY LOGS AND GTIDS;reset replica;"

mysql -uroot -h127.0.0.1 -P3326 -e "create user if not exists rpl_user@'%' identified  by 'rpl_pass';grant replication client, replication slave on *.* to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3326 -e "change replication source to source_user='rpl_user', source_password='rpl_pass' for channel 'group_replication_recovery';"
mysql -uroot -h127.0.0.1 -P3326 -e "RESET BINARY LOGS AND GTIDS; reset replica;"
