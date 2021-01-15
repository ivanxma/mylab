. ./comm.sh
mysqlbackup --defaults-file=config/restore.cnf   --uncompress --backup-dir=/home/mysql/backup/full/ copy-back-and-apply-log

