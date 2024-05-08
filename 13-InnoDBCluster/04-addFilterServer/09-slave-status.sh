. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -e "show replica status\G"
