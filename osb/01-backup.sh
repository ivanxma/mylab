. ./comm.sh
echo "*********************************************************"
echo "backing up Database using MEB ....."

TSDIR=`date +'%Y-%m-%d_%H-%M-%S'`
BKUPDIR=/home/mysql/backup/full

rm -rf /meb-test/backupdir; mkdir -p /meb-test/backupdir


/usr/local/mysql/bin/mysqlbackup --user=root --host=127.0.0.1 --port=3306 --password=MySQL1sGreat! --backup-image=sbt:bi-${TSDIR} --backup-dir=/meb-test/backupdir --sbt-lib-path=/usr/local/oracle/backup/lib/libobk.so --verbose --sbt-environment=OB_DEVICE=mypool01 backup-to-image

echo "*********************************************************"

