. ./comm.sh

if [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
then
	echo "MySQL Server is running ....."
	echo "Please stop the server before restore...."
	exit
fi


rm -rf /home/mysql/data/3306
rm -rf /home/mysql/backup/toberestored
mkdir -p /home/mysql/backup/toberestored

IMAGE=`ls -lt /home/mysql/backup/full/*/*.img|sed -n '1 p'|awk '{print $9;}'`

mysqlbackup --defaults-file=config/my1.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$IMAGE \
	image-to-backup-dir

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my1.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-log

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my1.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

MYDATADIR=`grep datadir config/my1.cnf|cut -f2 -d=`

if [ -r `dirname $IMAGE`/mysqld-auto.cnf ]
then
	cp `dirname $IMAGE`/mysqld-auto.cnf $MYDATADIR
	echo "persisted config restored"	
else
	echo "No persisted config to be restored"	
fi

