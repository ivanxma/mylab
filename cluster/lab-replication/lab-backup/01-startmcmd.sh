DIRNAME=`dirname $0`
if [ $DIRNAME == "." ]
then
	DIRNAME=`pwd`
fi

PGM=`basename $0`
. $DIRNAME/comm.sh
if [ $# -ne 1 ]
then
	echo "usage : $PGM [ local | all ]"
	exit
fi
if [ "$1" == "all"  -o "$1" == "local" ]
then
	echo "Starting local mcmd"
	sleep 2
	nohup mcmd --log-level=debug > nohup.out 2>&1 &
fi
if [ "$1" == "all" ]
then
	echo "creating directory on $SECONDARY - $DIRNAME"
	eval ssh $SECONDARY "/bin/mkdir -p $DIRNAME"
	scp secondary/* $SECONDARY:$DIRNAME
	echo "starting secondary"
	sleep 2
	ssh $SECONDARY "$DIRNAME/01-startmcmd.sh"
fi
