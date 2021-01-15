. ./comm.sh

echo "Selecting data on 3316"
mysql -t -uroot -h127.0.0.1 -P3316 -pmysql -e "select @@hostname, @@port;"

echo "********************************"
echo "Selecting data on 3306"
mysql -t  -uroot -h127.0.0.1 -P3306 -pmysql -e "select @@hostname, @@port;"
