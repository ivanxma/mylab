. ./comm.sh

rm -rf /home/mysql/backup/full/3326

mysqlbackup --port=3326 --host=127.0.0.1 --protocol=tcp --user=root -pmysql --backup-dir=/home/mysql/backup/full/3326 --no-history-logging  --backup-image=image3326.img --compress backup-to-image

# to workaround 'persisted variables' not backup by mysqlbackup -
# https://dev.mysql.com/doc/mysql-enterprise-backup/8.0/en/bugs.backup.html
# Persisted System Variables are not supported by mysqlbackup. 
# The file mysqld-auto.cnf is not included in a backup, 
# so that all the persisted settings on the backed up server will be lost when the server is restored. 
# As a workaround, after the backup operation is finished, 
# transfer mysql-auto.cnf manually from the backed-up server into the data directory inside the backup. 


MYDATADIR=` mysql -uroot -h127.0.0.1 -pmysql -P3326 -e "select @@datadir\G" |grep datadir|cut -f2 -d\  `
echo $MYDATADIR


DEST=/home/mysql/backup/full/3326

echo "COPY $MYDATADIR/mysqld-auto.cnf to the backup folder - $DEST"
cp $MYDATADIR/mysqld-auto.cnf $DEST



