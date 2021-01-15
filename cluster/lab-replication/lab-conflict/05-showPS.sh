. ./comm.sh

mysql -uroot -h$PRIMARY -P$MYPORT -e "select @@hostname;show slave status\G"
echo "Press <ENTER>"
read
mysql -uroot -h$SECONDARY -P$MYPORT -e "select @@hostname;show slave status\G"
echo "Press <ENTER>"
read
mysql -uroot -h$PRIMARY -P$MYPORT -e "select @@hostname;show global variables like 'ndb_slave%';"
mysql -uroot -h$SECONDARY -P$MYPORT -e "select @@hostname;show global variables like 'ndb_slave%';"
