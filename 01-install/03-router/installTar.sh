. ../router-file.sh


if [ $USER != 'root' ]
then
	echo "Please install it with root"
else

if [ ! -d $ROUTERFOLDER ]
then
cd /opt;tar -zxvf $ROUTERTAR
else
	echo "$ROUTERFOLDER already exists"
fi

if [ ! -h $ROUTERLINK ]
then
cd /usr/local
ln -s $ROUTERFOLDER $ROUTERLINK
else
	echo "$ROUTERLINK link already exists"
fi

chown -R mysql:mysql $ROUTERFOLDER
chown -h mysql:mysql $ROUTERLINK

fi




