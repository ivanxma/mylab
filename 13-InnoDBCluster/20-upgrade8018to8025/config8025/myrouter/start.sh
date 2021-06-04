#!/bin/bash
basedir=/home/mysql/mylab/13-InnoDBCluster/config/myrouter
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/router8025/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
