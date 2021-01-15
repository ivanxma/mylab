#!/bin/bash
if [ -f /home/mysql/lab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid ]; then
  kill -TERM `cat /home/mysql/lab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid` && rm -f /home/mysql/lab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid
fi
