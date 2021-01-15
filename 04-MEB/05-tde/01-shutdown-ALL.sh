. ./comm.sh
echo "Shutting down 3326 ..."
mysql -uroot -h127.0.0.1 -P3326 -pmysql -e "shutdown;"
sleep 5
echo "Shutting down 3316 ..."
mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "shutdown;"
sleep 5
echo "Shutting down 3306 ..."
mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "shutdown;"
sleep 5
