. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3306 -pmysql  -e "select sleep(10);" &
sleep 1
mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL


status

show processlist;


EOL
