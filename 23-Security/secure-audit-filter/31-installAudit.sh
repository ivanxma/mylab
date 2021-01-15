. ./comm.sh

if [ "$1" != "show" ]
then
	mysql --login-path=testroot -h127.0.0.1 < $MYSQL_HOME/share/audit_log_filter_linux_install.sql
fi


mysql  --login-path=testroot -h127.0.0.1 --table << EOL


SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS
     WHERE PLUGIN_NAME LIKE 'audit%';

select name from mysql.func where name like 'audit%';


EOL


