. ./comm.sh
echo "shutting down previous mysqld"
mysqladmin -uroot -h127.0.0.1 -P3306 shutdown
mysqladmin -uroot -h127.0.0.1 -P3316 shutdown
mysqladmin -uroot -h127.0.0.1 -P3326 shutdown
echo "waiting for complete shutdown of mysqld"
while [ `ps -ef|grep mysqld|grep -v grep|wc -l` -gt 0 ]
do
	sleep 1
	echo -n "."
done
echo "Stop Succeeded"

