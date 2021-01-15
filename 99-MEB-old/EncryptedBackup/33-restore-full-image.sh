. ./comm.sh

rm -rf /home/mysql/data/04-restore

mysql -uroot -h127.0.0.1 -P3306 -pmysql -e " select backup_id, backup_destination, from_unixtime(left(consistency_time_utc,10) + right(consistency_time_utc,6)/1000000) as backup_time, (end_time_utc - start_time_utc)/1000000 as duration from mysql.backup_history where backup_format='IMAGE' and backup_type='FULL' order by backup_time desc limit 1;"

# To restore the last backup imagej
DEST=`mysql -uroot -h127.0.0.1 -P3306 -pmysql -e " select backup_id, backup_destination, from_unixtime(left(consistency_time_utc,10) + right(consistency_time_utc,6)/1000000) as backup_time, (end_time_utc - start_time_utc)/1000000 as duration from mysql.backup_history where backup_format='IMAGE' and backup_type='FULL' order by backup_time desc limit 1\G" | \
        grep backup_destination|cut -f2 -d\ `
read

rm -rf /home/mysql/backup/toberestored
mkdir -p /home/mysql/backup/toberestored

for i in `ls -1 $DEST/*.img`
do
	j=`basename $i`
	mysqlbackup --defaults-file=config/my2.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$DEST/$j \
	--decrypt \
	--key-file=./mykeyfile \
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

MYDATADIR=`grep datadir config/my2.cnf|cut -f2 -d=`

if [ -r $DEST/mysqld-auto.cnf ]
then
	cp $DEST/mysqld-auto.cnf $MYDATADIR
fi

