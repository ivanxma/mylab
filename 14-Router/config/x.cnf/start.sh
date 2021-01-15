#!/bin/bash
basedir=/opt/lab/lab03-Router/config/x.cnf
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/mysql-router/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
