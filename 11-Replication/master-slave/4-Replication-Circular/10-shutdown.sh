. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316 -e "shutdown;"
sleep 5
mysql -uroot -h127.0.0.1 -P3326 -e "shutdown;"


