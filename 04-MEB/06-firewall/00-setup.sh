. ./comm.sh

mysql -uroot -h127.0.0.1 -P3316 -pmysql -e 'shutdown;'
mysql -uroot -h127.0.0.1 -P3326 -pmysql -e 'shutdown;'

mysql -uroot -h127.0.0.1 -P3306 -pmysql -e 'set global read_only=false; set global super_read_only=false;'

