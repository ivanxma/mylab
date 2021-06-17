#!/bin/bash
if [ -f /opt/download/lab/16-ReplicaSet/config/myrsrouter/mysqlrouter.pid ]; then
  kill -TERM `cat /opt/download/lab/16-ReplicaSet/config/myrsrouter/mysqlrouter.pid` && rm -f /opt/download/lab/16-ReplicaSet/config/myrsrouter/mysqlrouter.pid
fi
