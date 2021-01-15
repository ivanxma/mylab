. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3306 -pmysql -e "select * from mysql.backup_history\G"|more
read
mysql -t -uroot -h127.0.0.1 -P3306 -pmysql -e "select * from mysql.backup_progress\G"|more



