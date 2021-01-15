#!/bin/bash
basedir=/opt/lab/lab03-Router/config/myrouter.cnf
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/mysql-router/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
