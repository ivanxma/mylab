. ./comm.sh


mysql -uroot -h127.0.0.1 -P3316 -e "shutdown;"
sleep 5

rm -rf /home/mysql/backup/toberestored
mkdir -p /home/mysql/backup/toberestored

# To restore the last backup imagej
DEST=`mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "select backup_id, backup_format, \
        backup_destination from mysql.backup_history \
        where backup_format='IMAGE' and backup_type='FULL' \
        order by backup_id desc limit 1\G" |\
        grep backup_destination|cut -f2 -d\ `

for i in `ls -1 $DEST/*.img`
do
	j=`basename $i`
	mysqlbackup --defaults-file=config/my2.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$DEST/$j \
	image-to-backup-dir

done

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my2.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-log

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my2.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

