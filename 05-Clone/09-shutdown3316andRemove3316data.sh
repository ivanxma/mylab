. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "shutdown;"
sleep 5

rm -rf /home/mysql/data/3316
