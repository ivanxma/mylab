. ./comm.sh
tabs 20
echo "*****************************************"
echo "
alter user myaccount@'%' require ssl;
"

echo "*****************************************"

mysql --login-path=testroot -t << EOL1

alter user myaccount@'%' require ssl;
select user, host, ssl_type, account_locked, password_expired, password_last_changed  from mysql.user where user = 'myaccount';
EOL1
echo "*****************************************"
echo "Press <Enter> to continue to login via no SSL connection --ssl=false"
read

echo "--ssl option is removed from MySQL 8.0, you will see error."
echo mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl=false -e \"select 1\;\"
mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl=false -e "select 1;"

echo ""
echo "Please use --ssl-mode=disabled instead."
echo mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl-mode=disabled -e \"select 1\;\"
mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl-mode=disabled -e "select 1;"

echo "Press <Enter> to continue to login via SSL"

read
echo "*****************************************"
echo mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl-mode=REQUIRED -e \"select 1\;\"
mysql -umyaccount -h127.0.0.1 -pmyaccount --ssl-mode=REQUIRED -e "select 1;"
