
var mysql=require('mysql');

var s1 = mysql.getClassicSession('root@localhost:3306');
var s2 = mysql.getClassicSession('root@localhost:3316');
var s3 = mysql.getClassicSession('root@localhost:3326');

var x1 = s1.runSql('select @@port,@@super_read_only;');
var x2 = s2.runSql('select @@port,@@super_read_only;');
var x3 = s3.runSql('select @@port,@@super_read_only;');
print("servers [Port, SUPER_READ_ONLY] : ", x1.fetchAll(), x2.fetchAll(), x3.fetchAll());


