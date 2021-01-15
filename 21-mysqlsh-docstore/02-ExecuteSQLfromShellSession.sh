. ./comm.sh

ot=table
if [ $# -gt 0 ]
then
	if [ "$1" == "json" -o "$1" == "table"  ]
	then 
		ot=$1
	fi
fi

echo "This creates a Stored Procedure - my_add_one_procedure (INOUT incr_param INT)"
echo "It invokes the SP with parameter (10)"
echo "The results should return 11"

mysqlsh -uroot -h127.0.0.1 -P33100 -pwelcome1 --$ot --js -i << EOL

// Connect to a dedicated MySQL server using a connection URL
var mySession = mysqlx.getSession('root:welcome1@localhost:33100');
// Switch to use schema 'test'
mySession.sql("create database if not exists test;").execute();
mySession.sql("use test;").execute();

// In a NodeSession context the full SQL language can be used
mySession.sql("CREATE PROCEDURE my_add_one_procedure " +
  " (INOUT incr_param INT) " +
  "BEGIN " +
  "  SET incr_param = incr_param + 1;" +
  "END;").execute();
mySession.sql("SET @my_var = ?;").bind(10).execute();
mySession.sql("CALL my_add_one_procedure(@my_var);").execute();
mySession.sql("DROP PROCEDURE my_add_one_procedure;").execute();

// Use an SQL query to get the result
var myResult = mySession.sql("SELECT @my_var").execute();

// Gets the row and prints the first column
var row = myResult.fetchOne();
println(row[0]);

mySession.close()
EOL

