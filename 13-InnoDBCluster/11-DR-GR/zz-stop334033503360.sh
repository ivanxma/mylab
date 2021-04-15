. ./comm.sh

mysql -uroot -h127.0.0.1 -P3360 -e "shutdown;"
mysql -uroot -h127.0.0.1 -P3350 -e "shutdown;"
mysql -uroot -h127.0.0.1 -P3340 -e "shutdown;"
