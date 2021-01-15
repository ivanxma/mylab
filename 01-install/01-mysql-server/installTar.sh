
. ../server-file.sh

if [ $USER != 'root' ]
then
	echo "Please install it with root"
else

if [ ! -d $TARFOLDER ]
then
cd /opt;tar -zxvf $TARFILE
else
	echo "$TARFOLDER already exists"
fi

if [ ! -h /usr/local/mysql ]
then
cd /usr/local
ln -s $TARFOLDER /usr/local/mysql
else
	echo "/opt/mysql link already exists"
fi

chown -R mysql:mysql $TARFOLDER
chown -h mysql:mysql /usr/local/mysql

fi




