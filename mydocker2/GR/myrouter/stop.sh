#!/bin/bash
if [ -f /opt/download/lab/docker/GR/myrouter/mysqlrouter.pid ]; then
  kill -TERM `cat /opt/download/lab/docker/GR/myrouter/mysqlrouter.pid` && rm -f /opt/download/lab/docker/GR/myrouter/mysqlrouter.pid
fi
