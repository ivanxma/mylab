. ./comm.sh

ERRORFILE=`cat config/my1-secure.cnf |grep log-error|cut -f2 -d=`

SECURE=`cat $ERRORFILE|grep password|cut -f4 -d:|sed "s/ //g"`

echo $SECURE 
#mysqladmin -uroot -h127.0.0.1 -p$SECURE  password mysql
#mysql -uroot -h127.0.0.1 --connect-expired-password -p$SECURE -e "set password=password('mysql');"
mysql -uroot -h127.0.0.1 --connect-expired-password -p$SECURE -e "alter user root@'localhost' identified by 'mysql';"
