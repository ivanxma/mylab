#!/bin/bash
if [ -f /home/mysql/mylab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid ]; then
  kill -TERM `cat /home/mysql/mylab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid` && rm -f /home/mysql/mylab/13-InnoDBCluster/config/myrouter/mysqlrouter.pid
fi
