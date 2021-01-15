shell.connect('root:welcome1@localhost:3310');
var cl = dba.getCluster('mycluster');
print(cl.status());
