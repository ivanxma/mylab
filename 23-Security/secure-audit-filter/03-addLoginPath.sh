. ./comm.sh
echo "The Initialization setup defines the password for 'root' as 'mysql'"
echo "Please input the passwrod 'mysql' at the prompt"

mysql_config_editor set --login-path=testroot -uroot -h127.0.0.1 -P3306 -p

echo Please use "mysql --login-path=testroot" to login
