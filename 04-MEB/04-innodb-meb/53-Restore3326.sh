. ./comm.sh


rm -rf /home/mysql/data/3326
rm -rf /home/mysql/backup/toberestored

mkdir -p /home/mysql/backup/toberestored

IMAGE=`ls -lt /home/mysql/backup/full/*/*3316.img|sed -n '1 p'|awk '{print $9;}'`

echo "Restoring the last IMAGE file : $IMAGE"
echo "Press <ENTER> to proceed"
read

mysqlbackup --defaults-file=config/my3.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--backup-image=$IMAGE \
	image-to-backup-dir

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my3.cnf \
	--backup-dir=/home/mysql/backup/toberestored \
	--uncompress \
	apply-log

echo "PRESS <ENTER> to COPY-BACK 3326"
read


mysqlbackup --defaults-file=config/my3.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

MYDATADIR3=`grep datadir config/my3.cnf|cut -f2 -d=`

if [ -r config/3326/mysqld-auto.cnf ]
then
	cp config/3326/mysqld-auto.cnf $MYDATADIR3
	cp config/3326/auto.cnf $MYDATADIR3
	echo "persisted and UUID config restored"	
else
	echo "No persisted config to be restored"	
fi

