. ./comm.sh

mysql -uroot -h$SECONDARY -P$MYPORT -e "start slave io_thread;"

