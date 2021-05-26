. ./comm.sh

mysql -uroot -h127.0.0.1 -P3326 -e "rename user root@'localhost' to root@'%';"
mysql -uroot -h127.0.0.1 -P3316 -e "rename user root@'localhost' to root@'%';"
ssh $SECONDARY "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P3326 -e \"rename user root@'localhost' to root@'%';\""
ssh $SECONDARY "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P3316 -e \"rename user root@'localhost' to root@'%';\""

