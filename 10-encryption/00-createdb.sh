#!/bin/bash

export MYSQLBASE=/usr/local/mysql

export DEMODIR=/var/lib/mysql/data/secure

if [ ! -r $DEMODIR ]
then
	mkdir $DEMODIR
fi

if [ -r $DEMODIR/data1 ]
then
	rm -rf $DEMODIR/data1
fi


$MYSQLBASE/scripts/mysql_install_db --basedir=$MYSQLBASE --datadir=$DEMODIR/data1 --defaults-file=config/my1.cnf

