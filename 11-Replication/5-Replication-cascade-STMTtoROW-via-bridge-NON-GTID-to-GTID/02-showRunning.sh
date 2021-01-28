. ./comm.sh
mysql -uroot -h127.0.0.1 -P3316 -e "select @@hostname, @@port, 'is running';"
mysql -uroot -h127.0.0.1 -P3326 -e "select @@hostname, @@port, 'is running';"
mysql -uroot -h127.0.0.1 -P3336 -e "select @@hostname, @@port, 'is running';"
