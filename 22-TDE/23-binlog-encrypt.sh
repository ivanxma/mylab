. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -e "set persist binlog_encryption=on;"
mysql -uroot -h127.0.0.1 -P3306 -e "show binary logs;"

