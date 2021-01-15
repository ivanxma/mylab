. ./comm.sh

mysqlslap -a -uroot -h127.0.0.1 -i 10 -c 60 &

while [ `ps -ef|grep mysqlslap|grep -v grep|wc -l` -gt 0 ]
do
	mysql -t -uroot -h127.0.0.1 << EOL
	
	select TP_GROUP_ID, CONNECTION_COUNT, THREAD_COUNT, 
		ACTIVE_THREAD_COUNT, STALLED_THREAD_COUNT, WAITING_THREAD_NUMBER
	from information_schema.TP_THREAD_GROUP_STATE
	where 	active_thread_count > 0;
EOL
sleep 1
done


