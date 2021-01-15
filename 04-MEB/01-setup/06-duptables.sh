. ./comm.sh

mysqlsh --uri root:mysql@127.0.0.1:3306 << EOL

var i
for (i=0;i<1000;i++) {
	session.runSql('set sql_log_bin=0');
	session.runSql('create table mydb.xmytable' + i + ' (primary key(f1)) select * from  mydb.mytable1');
	session.runSql('set sql_log_bin=1');
}

EOL
