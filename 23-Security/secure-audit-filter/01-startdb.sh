#!/bin/bash
. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

mysqld --defaults-file=config/my1-secure.cnf &

sleep 2

ERRORFILE=`cat config/my1-secure.cnf |grep log-error|cut -f2 -d=`
cat $ERRORFILE

