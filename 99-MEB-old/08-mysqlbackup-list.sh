. ./comm.sh
DEST=`mysql -uroot -pmysql -h127.0.0.1 -P3306 -e "select backup_id, backup_format, \
	backup_destination from mysql.backup_history \
	where backup_format='IMAGE' and backup_type='FULL' \
	order by backup_id desc limit 1\G" |\
	grep backup_destination|cut -f2 -d\ `
for i in `ls -1 $DEST/*.img`
do
	j=`basename $i`
	echo "Image : " $DEST $j

	read
	mysqlbackup --backup-dir=$DEST --backup-image=$j list-image|more
done
