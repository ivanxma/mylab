. ./comm.sh

STATUSLINE=`mysql -uroot -h127.0.0.1 -P3316 -e "show master status;"|sed -n '2p' `
LOGFILE=`echo $STATUSLINE |awk '{print $1}'`
LOGPOS=`echo $STATUSLINE |awk '{print $2}'`



mysql -uroot -h127.0.0.1 -P3326 << EOL3326
stop slave for channel 'channel1';
reset master;
reset replica;
EOL3326
mysql -uroot -h127.0.0.1 -P3336 << EOL3336
stop slave for channel 'channel1';
reset master;
reset replica;
EOL3336

mysql -uroot -h127.0.0.1 -P3326 << EOL1

change replication source to
source_host='127.0.0.1',
source_user='repl',
source_password='repl',
source_port=3316,
ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS=local,
source_log_file="$LOGFILE",
source_log_pos=$LOGPOS
for channel 'channel1';

start replica for channel 'channel1';

show replica status for channel 'channel1'\G
EOL1

mysql -uroot -h127.0.0.1 -P3336 << EOL2

change replication source to
source_host='127.0.0.1',
source_user='repl',
source_password='repl',
source_port=3326,
source_auto_position=1
for channel 'channel1';

start replica for channel 'channel1';

show replica status for channel 'channel1'\G
EOL2


