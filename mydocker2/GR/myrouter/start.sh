#!/bin/bash
basedir=/opt/download/lab/docker/GR/myrouter
ROUTER_PID=$basedir/mysqlrouter.pid /usr/local/mysql/bin/mysqlrouter -c $basedir/mysqlrouter.conf &
disown %-
