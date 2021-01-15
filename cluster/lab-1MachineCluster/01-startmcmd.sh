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
	nohup mcmd > nohup.out 2>&1 &
fi
