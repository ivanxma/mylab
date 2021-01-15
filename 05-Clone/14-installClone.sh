. ./comm.sh

INSTALLED=`mysqlsh --sql --uri root:mysql@127.0.0.1:3316 -e " select plugin_name,plugin_status from information_schema.plugins where plugin_name='clone';"|grep ACTIVE|grep -v grep|wc -l`

if [ $INSTALLED -eq 0 ]
then
mysql -t -uroot -h127.0.0.1 -P3316 -pmysql -e "INSTALL PLUGIN clone SONAME 'mysql_clone.so';"
else
	echo "CLONE plugin already installed"
fi


mysql -t -uroot -h127.0.0.1 -P3316 -pmysql -e "
SELECT PLUGIN_NAME, PLUGIN_STATUS
       FROM INFORMATION_SCHEMA.PLUGINS
       WHERE PLUGIN_NAME LIKE 'clone';
"
