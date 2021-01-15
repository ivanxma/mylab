. ./comm.sh

mysql -uroot -h127.0.0.1 -P3326 -e "grant all on *.* to root@'%';"
ssh $SECONDARY "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P3326 -e \"grant all on *.* to root@'%';\""

