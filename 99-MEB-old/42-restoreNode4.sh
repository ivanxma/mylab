. ./comm.sh

rm -rf /home/mysql/data/04-node4

DEST=/home/mysql/backup/full/3326

rm -rf /home/mysql/backup/toberestored
mkdir -p /home/mysql/backup/toberestored

for i in `ls -1 $DEST/*.img`
do
	j=`basename $i`
	mysqlbackup --defaults-file=config/my4.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$DEST/$j \
	image-to-backup-dir

done

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my4.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-log

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my4.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

MYDATADIR=`grep datadir config/my4.cnf|cut -f2 -d=`

#Do not copy the persisted variables
# so that the group replication is not automatically started.
#cp $DEST/mysqld-auto.cnf $MYDATADIR


