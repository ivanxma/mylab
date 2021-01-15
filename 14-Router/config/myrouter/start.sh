#!/bin/bash
basedir=/opt/download/lab/14-Router/config/myrouter
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/router/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
