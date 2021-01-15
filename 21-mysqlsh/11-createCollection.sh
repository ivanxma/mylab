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

try {
	var myt = myworld_x.getCollection('mytest01') ;
	myworld_x.dropCollection('mytest01');
	println("[INFO] Collection dropped : mytest01");
}
catch (err) {
	println("[INFO] Collection not found : mytest01");
	println(err);
}

try {
	println("[INFO] Collection created : mytest01");
	var myColl = myworld_x.createCollection('mytest01');

session.startTransaction();
try {
  myColl.add({name: 'Jack', age: 15, height: 1.76, weight: 69.4}).execute();
  myColl.add({name: 'Susanne', age: 24, height: 1.65}).execute();
  myColl.add({name: 'Mike', age: 39, height: 1.9, weight: 74.3}).execute();

  // Commit the transaction if everything went well
  session.commit();

  println('Data inserted successfully.');
  myColl.find();
}
catch (err) {
  // Rollback the transaction in case of an error
  session.rollback();

  // Printing the error message
  println('Data could not be inserted: ' + err.message);
  println(err);
}

} catch (err) {
	println("Create Collection failure : stopped");
	println(err);
}
	

EOL

