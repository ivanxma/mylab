DIRNAME=`dirname $0`
. $DIRNAME/comm.sh
mcm << EOL

start cluster mycluster1;

EOL

./status.sh
