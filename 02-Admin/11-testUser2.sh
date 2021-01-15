. ./comm.sh

mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "show processlist;"
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "show processlist;"
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "show processlist;"
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select sleep(10);" &
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select sleep(10);" &
sleep 1
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "show processlist;"
sleep 1
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select sleep(10);" &
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select current_user(), user(); show processlist;"
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select sleep(10);" &
mysql -t -uuser2 -h127.0.0.1 -P3306 -puser2 -e "select current_user(), user(); show processlist;"


