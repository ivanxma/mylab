. ./comm.sh

rm -rf /home/mysql/backup/inc/toberestored
mkdir -p /home/mysql/backup/inc/toberestored

IMAGE=`ls -lt /home/mysql/backup/inc/*/*inc.img|sed -n '1 p'|awk '{print $9;}'`

# To restore the last backup imagej
mysqlbackup --defaults-file=config/my1.cnf \
	--backup-dir=/home/mysql/backup/inc/toberestored \
	--backup-image=$IMAGE \
	image-to-backup-dir

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my1.cnf \
	--incremental-backup-dir=/home/mysql/backup/inc/toberestored \
	--backup-dir=/home/mysql/backup/toberestored \
	apply-incremental-backup

echo "PRESS <ENTER>"
read


mysqlbackup --defaults-file=config/my1.cnf \
	--force \
	--backup-dir=/home/mysql/backup/toberestored copy-back

