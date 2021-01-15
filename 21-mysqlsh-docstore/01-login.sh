. ./comm.sh

ot=table
if [ $# -gt 0 ]
then
	if [ "$1" == "json" -o "$1" == "table" -o "$1" ]
	then 
		ot=$1
	fi
fi

mysqlsh -uroot -h127.0.0.1 -P33100 -pwelcome1 --$ot --js -i << EOL

// global session
session;


// XSession Object
mysession = mysqlx.getSession('root:welcome1@localhost:33100');

mysession.sql("select 'this is sql execution from session'");

EOL

