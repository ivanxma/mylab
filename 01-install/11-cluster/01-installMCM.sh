MCMNAME=mcm-1.4.8-linux-el7-x86-64bit
MCMFOLDER=/opt/${MCMNAME}
MCMLINK=/home/mysql/mcm/mcm-latest
MCMTAR=/opt/download/mysql/mcm/mcm-1.4.8-linux-el7-x86-64bit.tar.gz




if [ $USER != 'root' ]
then
	echo "Please install it with root"
else
mkdir -p /home/mysql/mcm
chown -R mysql:mysql /home/mysql/mcm

if [ ! -d $MCMFOLDER ]
then
cd /opt;tar -zxvf $MCMTAR
else
	echo "$MCMFOLDER already exists"
fi

if [ ! -h $MCMLINK ]
then
	mv $MCMFOLDER/mcm1.4.8 /home/mysql/mcm/
	ln -s /home/mysql/mcm/mcm1.4.8 $MCMLINK
else
	echo "$MCMLINK link already exists"
fi

chown -R mysql:mysql /home/mysql/mcm
chown -h mysql:mysql $MCMLINK

fi




