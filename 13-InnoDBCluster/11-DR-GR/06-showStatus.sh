. ./comm.sh

if [ $# -gt 0 ]
then
	MYHOST=$1
	MYPORT=3340
	if [ $# -gt 1 ]
	then
		MYPORT=$2
	fi
else
	MYHOST=$PRIMARY
	MYPORT=3310
fi

mysqlsh --uri gradmin:grpass@${MYHOST}:${MYPORT} << EOL
print(dba.getCluster().status());
EOL
