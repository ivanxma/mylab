. ./comm.sh

echo "Shutting Down the 3316 Instance"
echo "to prepare for Incremental Recovery"
mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "shutdown;"

