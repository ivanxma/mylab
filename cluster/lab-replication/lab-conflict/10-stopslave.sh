. ./comm.sh

mysql -uroot -h$SECONDARY -P$MYPORT -e "stop slave io_thread;show slave status\G"

