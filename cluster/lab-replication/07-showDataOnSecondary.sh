. ./comm.sh
echo "Showing data from test.mytable from secondary site"
ssh $SECONDARY  "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P$MYPORT -e \"select count(*) from test.mytable;\""
echo "Showing data from test.mytable2 from secondary site"
ssh $SECONDARY  "$MYSQL_PATH/bin/mysql -uroot -h127.0.0.1 -P$MYPORT -e \"select count(*) from test.mytable2;\""
