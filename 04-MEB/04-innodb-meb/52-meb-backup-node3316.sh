. ./comm.sh
echo "*********************************************************"
echo "backing up Database 3316 using MEB ....."


TSDIR=`date +'%Y-%m-%d_%H-%M-%S'`
BKUPDIR=/home/mysql/backup/full

if [ -d $BKUPDIR/$TSDIR ]
then
	echo "The backup folder - $BKUPDIR/$TSDIR  exists."
	exit
else
	mkdir -p $BKUPDIR/$TSDIR
fi


time mysqlbackup --port=3316 --host=127.0.0.1 --protocol=tcp --user=root -pmysql --backup-dir=${BKUPDIR}/${TSDIR} --backup-image=${BKUPDIR}/${TSDIR}/image3316.img --compress --no-history-logging backup-to-image > /tmp/mybackup.log 2>&1

echo "*********************************************************"
read
cat /tmp/mybackup.log


# to workaround 'persisted variables' not backup by mysqlbackup -
# https://dev.mysql.com/doc/mysql-enterprise-backup/8.0/en/bugs.backup.html
# Persisted System Variables are not supported by mysqlbackup. 
# The file mysqld-auto.cnf is not included in a backup, 
# so that all the persisted settings on the backed up server will be lost when the server is restored. 
# As a workaround, after the backup operation is finished, 
# transfer mysql-auto.cnf manually from the backed-up server into the data directory inside the backup. 
#
# The workaround is only valid for MySQL 8.0.18 or before. 
#	8.0.19 fixes the backup on auto.cnf and mysqld-auto.cnf
#


MYDATADIR=`grep datadir config/my2.cnf|cut -f2 -d=`
echo $MYDATADIR

#IMAGE=`ls -lt /home/mysql/backup/full/*/*3316.img|sed -n '1 p'|awk '{print $9;}'`
IMAGE=${BKUPDIR}/${TSDIR}/image3316.img
DEST=`dirname $IMAGE`

if [ -r $MYDATADIR/mysqld-auto.cnf ]
then
	echo "COPY $MYDATADIR/mysqld-auto.cnf to the backup folder - $DEST"
	cp $MYDATADIR/mysqld-auto.cnf $DEST
fi

if [ -r $MYDATADIR/auto.cnf ]
then
	echo "COPY $MYDATADIR/auto.cnf to the backup folder - $DEST"
	cp $MYDATADIR/auto.cnf $DEST
fi


