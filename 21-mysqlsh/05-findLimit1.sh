. ./comm.sh

ot=table
if [ $# -gt 0 ]
then
	if [ "$1" == "json" -o "$1" == "table"  ]
	then 
		ot=$1
	fi
fi

mysqlsh -uroot -h127.0.0.1 -P33100 -pwelcome1 --$ot --js -i << EOL

var myworld_x = session.getSchema('world_x');
var myci = myworld_x.getCollection('countryinfo');

myci.find().limit(1);
myci.find().sort(['GNP desc']).limit(1);
EOL

