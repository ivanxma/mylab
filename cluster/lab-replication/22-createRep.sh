DIRNAME=`dirname $0`
if [ $DIRNAME == "." ]
then
	DIRNAME=`pwd`
fi
. ./comm.sh


mysql -uroot -h127.0.0.1 -P$MYPORT -e "reset master;"

# note : this is new setup, so checking the one on this server should be the same as the other server
# For real case, the FILE and POS should be retrieved from the actual server.
#
LOGFILE=`mysql -uroot -h127.0.0.1 -P$MYPORT -e "show master status\G"|grep File|cut -f2 -d:|sed  "s/ //g"`
LOGPOS=`mysql -uroot -h127.0.0.1 -P$MYPORT -e "show master status\G"|grep Position|cut -f2 -d:|sed  "s/ //g"`

echo "export LOGFILE=$LOGFILE" > mylogfile.sh
echo "export LOGPOS=$LOGPOS" >> mylogfile.sh

scp mylogfile.sh $SECONDARY:$DIRNAME


mysql -uroot -h127.0.0.1 -P$MYPORT << EOL

-- drop user rep@'%';
create user rep@'%' identified by 'rep';
grant replication slave on *.* to rep@'%';

change master to 
	master_host='$SECONDARY',
	master_port=$MYPORT,
	master_user='rep',
	master_password='rep',
	master_log_file='$LOGFILE',
	master_log_pos=$LOGPOS;
reset master;
EOL

ssh $SECONDARY "$DIRNAME/22-createRep.sh $MYPORT"


