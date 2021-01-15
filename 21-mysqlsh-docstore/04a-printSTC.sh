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

session.getSchemas();
var myworld_x = session.getSchema('world_x');


var mytables = myworld_x.getTables();
var mycollections = myworld_x.getCollections();
print("Schema : " , myworld_x);
print("Tables :" , mytables);
print("Collections :" , mycollections);
EOL

