. ./comm.sh


mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "

x = dba.getCluster()

x.addInstance('gradmin:grpass@$SECONDARY:3340', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY:13340',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"


mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "

x = dba.getCluster()

x.addInstance('gradmin:grpass@$SECONDARY:3350', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY:13350',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"

sleep 5

mysqlsh --uri gradmin:grpass@$PRIMARY:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY:3360', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY:13360',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"

