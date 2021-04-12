. ./comm.sh
mysql -ugradmin -pgrpass -h$PRIMARY -P3310 -e "show variables like 'gtid_execu%';"
mysql -ugradmin -pgrpass -h$SECONDARY -P3340 -e "show variables like 'gtid_execu%';"
