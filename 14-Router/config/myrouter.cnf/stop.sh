if [ -f /opt/lab/lab03-Router/config/myrouter.cnf/mysqlrouter.pid ]; then
  kill -HUP `cat /opt/lab/lab03-Router/config/myrouter.cnf/mysqlrouter.pid`
  rm -f /opt/lab/lab03-Router/config/myrouter.cnf/mysqlrouter.pid
fi
