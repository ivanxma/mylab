. ./comm.sh


rm -rf /home/mysql/data/3316
rm -rf /home/mysql/data/3326
rm -rf /home/mysql/backup/toberestored

mkdir -p /home/mysql/backup/toberestored

#IMAGE=`ls -lt /home/mysql/backup/full/*/*.img|sed -n '1 p'|awk '{print $9;}'`
IMAGE=/home/mysql/backup/full/20200213/image3306.img

mysqlbackup --defaults-file=config/my1.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$IMAGE \
	image-to-backup-dir

echo "PRESS <ENTER>"
#read


mysqlbackup --defaults-file=config/my2.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-log

echo "PRESS <ENTER> to COPY-BACK to 3316 and 3326"
#read


mysqlbackup --defaults-file=config/my2.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

mysqlbackup --defaults-file=config/my3.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

MYDATADIR2=`grep datadir config/my2.cnf|cut -f2 -d=`
MYDATADIR3=`grep datadir config/my3.cnf|cut -f2 -d=`

if [ -r `dirname $IMAGE`/mysqld-auto.cnf ]
then
	cp `dirname $IMAGE`/mysqld-auto.cnf $MYDATADIR1
	cp `dirname $IMAGE`/mysqld-auto.cnf $MYDATADIR2
	echo "persisted config restored"	
else
	echo "No persisted config to be restored"	
fi

