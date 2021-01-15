. ./comm.sh
mysqlbackup --defaults-file=config/mysqlbackup.cnf   --port=3306 --host=127.0.0.1 --user=mysqlbackup --password --uncompress --backup-dir=/home/mysql/backup/full/myrestore --datadir=/home/mysql/data/MEB copy-back-and-apply-log

