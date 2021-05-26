. ./comm.sh


mysql -uroot -h127.0.0.1 -P$MYPORT -e "start slave;"
ssh $SECONDARY "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P$MYPORT -e \"start slave;\""
ssh $SECONDARY "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P$MYPORT -e \"show slave status\\G\""

