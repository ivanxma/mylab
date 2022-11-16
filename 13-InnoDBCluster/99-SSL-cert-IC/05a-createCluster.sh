. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "

var x = dba.createCluster('mycluster', {exitStateAction:'OFFLINE_MODE',
	consistency:'BEFORE_ON_PRIMARY_FAILOVER',
	expelTimeout:30,
/*	memberSslMode:'REQUIRED', */
	clearReadOnly:true,
	interactive:false,
	autoRejoinTries:120,
	memberWeight:80,
	replicationAllowedHost:'$CLUSTER_IPALLOWLIST',
	memberSslMode:'VERIFY_CA', 
	communicationStack:'MYSQL'
	})
x = dba.getCluster()
print(x.status())
"

