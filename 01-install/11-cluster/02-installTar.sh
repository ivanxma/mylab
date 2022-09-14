NDBFOLDER=/usr/local/mysql-cluster-commercial-8.0.30-linux-glibc2.12-x86_64
NDBLINK=/home/mysql/mcm/cluster-latest
NDBTAR=/workshop/linux/ndb/mysql-cluster-commercial-8.0.30-linux-glibc2.12-x86_64.tar.gz




if [ $USER != 'root' ]
then
	echo "Please install it with root"
else
mkdir -p /home/mysql/mcm
chown -R mysql:mysql /home/mysql/mcm

if [ ! -d $NDBFOLDER ]
then
cd /usr/local;tar -zxvf $NDBTAR
else
	echo "$NDBFOLDER already exists"
fi

if [ ! -h $NDBLINK ]
then
	ln -s $NDBFOLDER $NDBLINK
else
	echo "$NDBLINK link already exists"
fi

chown -R mysql:mysql $NDBFOLDER
chown -h mysql:mysql $NDBLINK

fi




