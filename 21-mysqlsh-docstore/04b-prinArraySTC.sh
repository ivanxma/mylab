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

// global session
session.getSchemas();

// Connecting to MySQL and working with a Session
var mysqlx = require('mysqlx').mysqlx;

// Connect to a dedicated MySQL server using a connection URL
var mySession = mysqlx.getSession('root:welcome1@localhost:33100');

// Get a list of all available schemas
var schemaList = mySession.getSchemas();

print('Available schemas in this session:\n');

// Loop over all available schemas and print their name
for (index in schemaList) {
  print(schemaList[index].name + '\n');
}


// Getting Tablelist in database 'world_x'
var tableList = mySession.getSchema('world_x').getTables();
print('Available Tables in world_x :');

// Loop over all available schemas and print their name
for (index in tableList) {
  print(index + ":" + tableList[index].name + '\n');
}

// Getting Tablelist in database 'world_x'
var collList = mySession.getSchema('world_x').getCollections();
print('Available Collections in world_x :');

// Loop over all available schemas and print their name
for (index in collList) {
  print(index + ":" +  collList[index].name + '\n');
}
mySession.close();



EOL

