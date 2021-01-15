. ./comm.sh

mysqlsh -i --uri root:welcome1@localhost:3310  -e "
 dba.startSandboxInstance(3320);
 dba.getCluster().addInstance('root:welcome1@localhost:3320');
 dba.getCluster().status();
"
