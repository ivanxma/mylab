. ./comm.sh

IMAGE=`ls -lt /home/mysql/backup/full/*/*.img|sed -n '1 p'|awk '{print $9;}'`

TSDIR=`date +'%Y-%m-%d_%H-%M-%S'`
BKUPDIR=/home/mysql/backup/inc

if [ -d $BKUPDIR/$TSDIR ]
then
	echo "The backup folder - $BKUPDIR/$TSDIR exists"
	exit
else
	mkdir -p $BKUPDIR/$TSDIR
fi

mysqlbackup --host=127.0.0.1 --user=root -pmysql --protocol=tcp \
	--port=3306  \
	--incremental \
	--incremental-base=dir:`dirname ${IMAGE}` \
	--backup-dir=${BKUPDIR}/${TSDIR} \
	--backup-image=${BKUPDIR}/${TSDIR}/image3306inc.img \
	backup-to-image
