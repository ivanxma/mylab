. ./comm.sh
mysql -uroot -h127.0.0.1 -P3326 << EOL2
stop SLAVE SQL_THREAD;

EOL2
