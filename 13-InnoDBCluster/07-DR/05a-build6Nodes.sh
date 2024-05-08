. ./comm.sh


mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "

var x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3340', {exitStateAction:'OFFLINE_MODE',
        recoveryMethod:'clone',
        ipAllowlist:'$CLUSTER_IPALLOWLIST',
        localAddress:'$SECONDARY_HOST:13340',
        autoRejoinTries:120,
        memberWeight:70
        })

x.addInstance('gradmin:grpass@$SECONDARY_HOST:3350', {exitStateAction:'OFFLINE_MODE',
        recoveryMethod:'clone',
        ipAllowlist:'$CLUSTER_IPALLOWLIST',
        localAddress:'$SECONDARY_HOST:13350',
        autoRejoinTries:120,
        memberWeight:70
        })

x.addInstance('gradmin:grpass@$SECONDARY_HOST:3360', {exitStateAction:'OFFLINE_MODE',
        recoveryMethod:'clone',
        ipAllowlist:'$CLUSTER_IPALLOWLIST',
        localAddress:'$SECONDARY_HOST:13360',
        autoRejoinTries:120,
        memberWeight:70
        })

print(x.status())
"

