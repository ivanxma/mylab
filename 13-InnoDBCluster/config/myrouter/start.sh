#!/bin/bash
basedir=/home/mysql/lab/13-InnoDBCluster/config/myrouter
ROUTER_PID=$basedir/mysqlrouter.pid /bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
