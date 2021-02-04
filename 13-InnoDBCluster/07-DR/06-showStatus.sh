. ./comm.sh

if [ $# -gt 0 ]
then
	MYHOST=$1
	MYPORT=3310
	if [ $# -gt 1 ]
	then
		MYPORT=$2
	fi
else
	MYHOST=$CLUSTER_HOST
	MYPORT=3310
fi

mysqlsh --uri gradmin:grpass@${MYHOST}:${MYPORT} -e "
print(dba.getCluster().status());
"

echo "Press <ENTER> to continue to show options"
read
mysqlsh --uri gradmin:grpass@${MYHOST}:${MYPORT} -e "
print(dba.getCluster().options());
"
