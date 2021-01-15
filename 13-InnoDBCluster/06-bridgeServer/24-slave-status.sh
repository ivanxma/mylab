. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -e "show replica status\G"
echo "Press <ENTER> to show 3316 status"
read
mysql -uroot -h127.0.0.1 -P3316 -e "show replica status\G"
