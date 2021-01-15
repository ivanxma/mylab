#!/bin/bash
if [ -f /opt/download/lab/14-Router/config/myrouter/mysqlrouter.pid ]; then
  kill -TERM `cat /opt/download/lab/14-Router/config/myrouter/mysqlrouter.pid` && rm -f /opt/download/lab/14-Router/config/myrouter/mysqlrouter.pid
fi
