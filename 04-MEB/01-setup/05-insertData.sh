. ./comm.sh

mysqlsh --uri root:mysql@127.0.0.1:3306 << EOL
session.runSql('truncate table mydb.mytable1;')
session.runSql('truncate table mydb.mytable2;')

var i
for (i=0;i<10000;i++) {
	session.runSql('insert into mydb.mytable1 (f1, f2) values (' + i + ', "hello world");');
	session.runSql('insert into mydb.mytable2 (f2) values ("hello world");');
}
var x=session.runSql('select count(*) from mydb.mytable1').fetchAll();
var y=session.runSql('select count(*) from mydb.mytable2').fetchAll();
print('\nrowcount (mytable1) = ' + x[0][0]);
print('\nrowcount (mytable2) = ' + y[0][0]);
print('\n');

EOL
