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

print("Table : City [SELECT]");
myworld_x.City.select().limit(5).execute();

print("Collection : CountryInfo [FIND]");
myworld_x.countryinfo.find().limit(1);
print("Collection : CountryInfo [FIND - condition GNP > 1000 and Name like 'A%']");
myworld_x.countryinfo.find("GNP > 1000 and Name like 'A%'").limit(1);

EOL

