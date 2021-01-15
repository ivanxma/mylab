. ./comm.sh

MYDIR=`pwd`
PGM=`basename $0`

# create cluster
mysqlsh -i --js --uri=gr_user:gr_pass@primary:3310 << EOL
var c1 = dba.rebootClusterFromCompleteOutage('mycluster', {rejoinInstances:[ "primary:3320", "primary:3330" ]});
c1.status();
EOL
