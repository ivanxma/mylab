. ./comm.sh

pkill -9 mysqld

mysqlsh --js -i  -e "

 dba.startSandboxInstance(3310);
 dba.startSandboxInstance(3320);
 dba.startSandboxInstance(3330);
 shell.connect('root:welcome1@localhost:3310');

 dba.rebootClusterFromCompleteOutage('mycluster', { rejoinInstances:['localhost:3320', 'localhost:3330'] });
 dba.getCluster().status();
"
