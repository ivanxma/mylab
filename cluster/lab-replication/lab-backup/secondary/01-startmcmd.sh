DIRNAME=`dirname $0`
if [ $DIRNAME == "." ]
then
	DIRNAME=`pwd`
fi
. $DIRNAME/comm.sh

nohup mcmd --log-level=debug > nohup.out 2>&1 &

