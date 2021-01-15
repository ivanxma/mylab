. ./comm.sh

DEST=`mysql -uroot -pmysql -h127.0.0.1 -P3306 -e "select backup_id, backup_format, \
	backup_destination from mysql.backup_history \
	where backup_format='IMAGE' and backup_type='FULL' \
	order by backup_id desc limit 1\G" |\
	grep backup_destination|cut -f2 -d\ `

echo $DEST
MYDATE=`date +"%Y%m%d%H%M%S"`

mysqlbackup --host=127.0.0.1 --user=root -pmysql --protocol=tcp \
	--port=3306  \
	--incremental \
	--incremental-base=dir:$DEST  \
	--backup-dir=/home/mysql/backup/inc --with-timestamp \
	--backup-image=image3306inc.img \
	backup-to-image
