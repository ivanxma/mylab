. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -e "show binary logs;"
./22-createTable.sh
mysqlbinlog --read-from-remote-server -uroot -h127.0.0.1 -P3306 binlog.000002 > /tmp/x.sql

more /tmp/x.sql

rm /tmp/x.sql
mysql -uroot -h127.0.0.1 -P3306 -e "show binary logs;"
mysql -uroot -h127.0.0.1 -P3306 -e "show variables like 'binlog_encryption';"
