. ./comm.sh
mysqlbackup --port=3306 --host=127.0.0.1 --protocol=tcp --user=root -pmysql --backup-dir=/home/mysql/backup/full --with-timestamp --backup-image=image3306.img --encrypt --key-file=./mykeyfile --compress backup-to-image

# to workaround 'persisted variables' not backup by mysqlbackup -
# https://dev.mysql.com/doc/mysql-enterprise-backup/8.0/en/bugs.backup.html
# Persisted System Variables are not supported by mysqlbackup. 
# The file mysqld-auto.cnf is not included in a backup, 
# so that all the persisted settings on the backed up server will be lost when the server is restored. 
# As a workaround, after the backup operation is finished, 
# transfer mysql-auto.cnf manually from the backed-up server into the data directory inside the backup. 


MYDATADIR=` mysql -uroot -h127.0.0.1 -pmysql -P3306 -e "select @@datadir\G" |grep datadir|cut -f2 -d\  `
echo $MYDATADIR

DEST=`mysql -uroot -h127.0.0.1 -P3306 -pmysql -e " select backup_id, backup_destination, from_unixtime(left(consistency_time_utc,10) + right(consistency_time_utc,6)/1000000) as backup_time, (end_time_utc - start_time_utc)/1000000 as duration from mysql.backup_history where backup_format='IMAGE' and backup_type='FULL' order by backup_time desc limit 1\G" |  grep backup_destination|cut -f2 -d\ `

if [ -r $MYDATADIR/mysqld-auto.cnf ]
then
	echo "COPY $MYDATADIR/mysqld-auto.cnf to the backup folder - $DEST"
	cp $MYDATADIR/mysqld-auto.cnf $DEST
else
	echo "No Persisted Variables to be backup"
fi



