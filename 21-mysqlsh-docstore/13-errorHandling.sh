. ./comm.sh


MYUSER=$1
MYDB=$2
MYPWD=$3

ot=table
if [ $# -gt 0 ]
then
	if [ "$1" == "json" -o "$1" == "table"  ]
	then 
		ot=$1
	fi
fi

mysqlsh -uroot -h127.0.0.1 -P33100 -pwelcome1 --$ot --js -i << EOL

println("starting..");

var mySession;

println("starting2..");


try {
  println("starting..");
  mySession = mysqlx.getSession( { host:'127.0.0.1', port:33100, user:'$MYUSER', password:'$MYPWD' } ); 
  println("connection..");

  try {
    var myDb = mySession.getSchema('$MYDB');

    // Use the collection 'my_collection'
    var myColl = myDb.getCollection('countryinfo');

    // Find a document
    var myDoc = myColl.find('Name like :param').limit(1).bind('param','A%').execute();

    // Print document
    println(myDoc.fetchOne());
  }
  catch (err) {
    println('The following error occurred: ' + err.message);
    println(err);
  }
  finally {
    // Close the session in any case
    mySession.close();
  }

}
catch (err) {
  println('The database session could not be opened: ' + err.message);
  println(err);
}

EOL
