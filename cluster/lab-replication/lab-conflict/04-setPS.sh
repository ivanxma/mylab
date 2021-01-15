. ./comm.sh

mysql -uroot -h$PRIMARY -P$MYPORT -e "stop slave sql_thread;"
mysql -uroot -h$SECONDARY -P$MYPORT -e "stop slave sql_thread;"

mysql -uroot -h$PRIMARY -P$MYPORT -e "set global ndb_slave_conflict_role='PRIMARY'";
mysql -uroot -h$SECONDARY -P$MYPORT -e "set global ndb_slave_conflict_role='SECONDARY'";

mysql -uroot -h$PRIMARY -P$MYPORT -e "start slave sql_thread;"
mysql -uroot -h$SECONDARY -P$MYPORT -e "start slave sql_thread;"
