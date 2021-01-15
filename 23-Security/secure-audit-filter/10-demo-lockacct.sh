. ./comm.sh
tabs 20
echo "*****************************************"
echo "This demo is to show how to create a USER with account locked"
echo "
create user myaccount@'%'
	identified by 'myaccount'
	account lock;
"
echo "*****************************************"
mysql  --login-path=testroot -t << EOL


drop user if exists myaccount@'%';
create user myaccount@'%'
	identified by 'myaccount'
	account lock;

select user, host, account_locked, password_expired, password_last_changed  from mysql.user where user = 'myaccount';

EOL

echo "login myaccount which is a locked account"
echo "*****************************************"
mysql -umyaccount -h127.0.0.1 -P3306  -pmyaccount

echo "*****************************************"

