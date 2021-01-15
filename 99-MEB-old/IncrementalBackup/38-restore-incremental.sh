. ./comm.sh

rm -rf /home/mysql/backup/inc/toberestored
mkdir -p /home/mysql/backup/inc/toberestored

# To restore the last backup imagej
DEST=`mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "select backup_id, backup_format, \
        backup_destination from mysql.backup_history \
        where backup_format='IMAGE' and backup_type='INCREMENTAL' and last_error_code=0 \
        order by backup_id desc limit 1\G" |\
        grep backup_destination|cut -f2 -d\ `

for i in `ls -1 $DEST/*.img`
do
	j=`basename $i`
	mysqlbackup --defaults-file=config/my2.cnf \
	--backup-dir=/home/mysql/backup/inc/toberestored \
	--backup-image=$DEST/$j \
	image-to-backup-dir

done

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my2.cnf \
	--incremental-backup-dir=/home/mysql/backup/inc/toberestored \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-incremental-backup

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my2.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

