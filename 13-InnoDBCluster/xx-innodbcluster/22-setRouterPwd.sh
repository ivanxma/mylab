. ./comm.sh
echo "HTTP password is stored in config/mysqlrouter.pwd"
echo "Setting password for HTTP REALM user 'myuser'"
mysqlrouter_passwd set config/mysqlrouter.pwd myuser
echo
echo "Verify password for HTTP REALM user 'myuser'"
mysqlrouter_passwd verify config/mysqlrouter.pwd myuser

