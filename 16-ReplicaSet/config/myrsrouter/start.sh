#!/bin/bash
basedir=/opt/download/lab/16-ReplicaSet/config/myrsrouter
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/router/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
