echo -n "Press <ENTER> to continue to switch Primary to $HOSTNAME:3310"
read


mysqlsh --js --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().setPrimaryInstance(\"$HOSTNAME:3310\"));"
mysqlsh --js --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().rescan());"
mysqlsh --js --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().status());"



