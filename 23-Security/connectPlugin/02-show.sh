. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

SELECT PLUGIN_NAME, PLUGIN_STATUS
       FROM INFORMATION_SCHEMA.PLUGINS
       WHERE PLUGIN_NAME LIKE 'connection%';

show variables like 'connection%';

EOL
