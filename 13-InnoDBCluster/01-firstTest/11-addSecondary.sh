. ./comm.sh


if [ "$1" == "3340" ]
then
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "

var x = dba.getCluster('mycluster');
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3340', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	ipAllowlist: '$CLUSTER_IPALLOWLIST',
	localAddress:'$SECONDARY_HOST:13340',
	autoRejoinTries:120,
	memberWeight:50
	})
print(x.status())
"
fi

if [ "$1" == "3350" ]
then

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3350', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	ipAllowlist: '$CLUSTER_IPALLOWLIST',
	localAddress:'$SECONDARY_HOST:13350',
	autoRejoinTries:120,
	memberWeight:40
	})
print(x.status())
"
fi
