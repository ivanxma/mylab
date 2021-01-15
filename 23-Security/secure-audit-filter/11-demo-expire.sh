. ./comm.sh
tabs 20
echo "
alter user myaccount@'%' account unlock;
alter user myaccount@'%' password expire;
"

echo "*****************************************"

mysql --login-path=testroot -t << EOL1

alter user myaccount@'%' account unlock;
alter user myaccount@'%' password expire;
show warnings;
select user, host, account_locked, password_expired, password_last_changed  from mysql.user where user = 'myaccount';
EOL1
echo "*****************************************"
echo "Running the following command would fail because the password is expired."
echo mysql -umyaccount -h127.0.0.1 -pmyaccount -e "select 1;"

mysql -umyaccount -h127.0.0.1 -pmyaccount -e "select 1;"

echo "Press <Enter> to continue"
read

echo "*****************************************"

echo "Now change password by issuing --connect-expred-password option"
#mysql -umyaccount -h127.0.0.1 --connect-expired-password -pmyaccount -e "set password=password('myaccount');"
mysql -umyaccount -h127.0.0.1 --connect-expired-password -pmyaccount -e "alter user myaccount@'%' identified by 'myaccount';"
mysql -umyaccount -h127.0.0.1 -pmyaccount -e "select 1;"
