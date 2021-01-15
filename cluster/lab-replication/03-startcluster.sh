DIRNAME=`dirname $0`
. $DIRNAME/comm.sh
mcm << EOL

start cluster mycluster1;
start cluster mycluster2;

EOL

./22-createRep.sh
