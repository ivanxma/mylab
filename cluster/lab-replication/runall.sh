DIRNAME=`dirname $0`
if [ $DIRNAME == "." ]
then
	DIRNAME=`pwd`
fi
. ./comm.sh

./reset.sh all
sleep 5
ssh $SECONDARY "$DIRNAME/reset.sh"
./01-startmcmd.sh all
sleep 5
./02-createCluster.sh
./03-startcluster.sh
./04-createData.sh
./05-insert.sh
./06-startSlave.sh
./07-showDataOnSecondary.sh
