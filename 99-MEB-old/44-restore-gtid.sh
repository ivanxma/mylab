. ./comm.sh
DEST=/home/mysql/backup/full/3326
mysql -uroot -h127.0.0.1  -P3426 -pmysql  -e "reset master;reset slave all;"
mysql -uroot -h127.0.0.1  -P3426 -pmysql  -e "set sql_log_bin=off; source $DEST/meta/backup_gtid_executed.sql; set SQL_LOG_BIN=ON;"




