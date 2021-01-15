#!/bin/bash
. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

mysqld --defaults-file=config/my1.cnf &

echo "Starting up MySQL Server with Plugin Enable :

[mysqld]
plugin-load-add=connection_control.so
connection-control=FORCE_PLUS_PERMANENT
connection-control-failed-login-attempts=FORCE_PLUS_PERMANENT
"
