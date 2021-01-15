. ./comm.sh
LOGFILE=`grep log-error  config/my1.cnf|cut -f2 -d\=`

PASS=`grep temporary $LOGFILE |sed 's/localhost: /\~/g'|cut -f2 -d\~`

mysql -uroot -h127.0.0.1 -P3306 -p"$PASS"  --connect-expired-password << EOL
alter user root@'localhost' identified with 'mysql_native_password' by 'mysql';
EOL

