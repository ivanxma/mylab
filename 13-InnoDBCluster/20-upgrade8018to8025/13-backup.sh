if [ -d backup ]
then
	rm -rf backup/2021*
	cd backup
fi

time /usr/local/mysql/bin/mysqlbackup --port=3310 --host=127.0.0.1 --protocol=tcp --user=mysqlbackup --password=password  --backup-dir=.  --with-timestamp backup-and-apply-log

echo -n "Press <ENTER> to do backup 2nd time"
read

time /usr/local/mysql/bin/mysqlbackup --port=3310 --host=127.0.0.1 --protocol=tcp --user=mysqlbackup --password=password  --backup-dir=.  --with-timestamp backup-and-apply-log
