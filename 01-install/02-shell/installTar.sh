
. ../shell-file.sh

if [ $USER != 'root' ]
then
	echo "Please install it with root"
	exit
fi

if [ ! -d $SHELLFOLDER ]
then
cd /opt;tar -zxvf $SHELLTAR
else
	echo "$SHELLFOLDER already exists"
fi

if [ ! -h $SHELLLINK ]
then
cd /usr/local
ln -s $SHELLFOLDER $SHELLLINK
else
	echo "$SHELLLINK link already exists"
fi



sudo mv $SHELLFOLDER/lib/mysqlsh/lib/python3.7/site-packages $SHELLFOLDER/lib/mysqlsh/lib/python3.7/site-packages.ori
sudo ln -s /usr/local/lib/python3.7/site-packages $SHELLFOLDER/lib/mysqlsh/lib/python3.7/site-packages 



chown -R mysql:mysql $SHELLFOLDER
chown -h mysql:mysql $SHELLLINK


