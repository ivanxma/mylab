if [ -f /opt/lab/lab03-Router/config/x.cnf/mysqlrouter.pid ]; then
  kill -HUP `cat /opt/lab/lab03-Router/config/x.cnf/mysqlrouter.pid`
  rm -f /opt/lab/lab03-Router/config/x.cnf/mysqlrouter.pid
fi
