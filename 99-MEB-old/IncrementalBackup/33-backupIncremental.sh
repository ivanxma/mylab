. ./comm.sh

MYDATE=`date +"%Y%m%d%H%M%S"`

mysqlbackup --host=127.0.0.1 --user=root -pmysql --protocol=tcp \
	--port=3306  \
	--incremental \
	--incremental-base=history:last_backup \
	--backup-dir=/home/mysql/backup/inc --with-timestamp \
	--backup-image=image3306inc.img \
	--compress \
	backup-to-image
