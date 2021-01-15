. ./comm.sh
mysqlbackup --port=3310 --host=127.0.0.1 --protocol=tcp --user=root --password=welcome1 --backup-dir=/home/mysql/backup/full --with-timestamp  backup-and-apply-log
