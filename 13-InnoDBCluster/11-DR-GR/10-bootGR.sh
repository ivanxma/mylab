. ./comm.sh


mysql -ugradmin -pgrpass -h$SECONDARY -P3340 << EOF
set sql_log_bin=off;
set global group_replication_bootstrap_group=on;
start group_replication;
set global group_replication_bootstrap_group=off;

EOF
mysql -ugradmin -pgrpass -h$SECONDARY -P3350 -e "set sql_log_bin=off;start group_replication;"
mysql -ugradmin -pgrpass -h$SECONDARY -P3360 -e "set sql_log_bin=off;start group_replication;"




