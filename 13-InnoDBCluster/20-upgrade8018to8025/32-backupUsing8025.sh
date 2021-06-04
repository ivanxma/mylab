if [ -d backup ]
then
	cd backup
fi
time /usr/local/mysql8025/bin/mysqlbackup --port=3310 --host=127.0.0.1 --protocol=tcp --user=mysqlbackup --password=password  --backup-dir=.  --with-timestamp backup-and-apply-log

