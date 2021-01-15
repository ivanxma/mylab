. ./comm.sh
mysqlbackup --port=3306 --host=127.0.0.1 --protocol=tcp --user=root --password=mysql --backup-dir=/tmp/backup/full --with-timestamp backup-and-apply-log
