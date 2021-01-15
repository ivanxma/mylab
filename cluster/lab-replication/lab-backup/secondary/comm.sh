export MCM_PATH=~/mcm/mcm-latest
export MEB_PATH=/usr/local/meb
export MYSQL_PATH=~/mcm/cluster-latest
export PATH=$MEB_PATH/bin:$MCM_PATH/bin:$MYSQL_PATH/bin:$PATH
if [ -r myport.txt ]
then
	MYPORT=`cat myport.txt`
else
	MYPORT=""
fi
export PRIMARY=primary
export SECONDARY=secondary
export MYPORT
