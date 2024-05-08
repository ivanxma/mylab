. ./comm.sh

pkill -9 mysqld

mysqlsh --js << EOL

dba.deploySandboxInstance(3310, {password:'welcome1'});
dba.deploySandboxInstance(3320, {password:'welcome1'});
dba.deploySandboxInstance(3330, {password:'welcome1'});

shell.connect('root:welcome1@localhost:3310');
var cl =dba.createCluster('mycluster', {multiMaster:true,force:true});
cl.addInstance('root:welcome1@localhost:3320');
cl.addInstance('root:welcome1@localhost:3330');
print(cl.status());


EOL

ls -l $HOME/mysql-sandboxes
