function sleep(miliseconds) {
   var currentTime = new Date().getTime();
   while (currentTime + miliseconds >= new Date().getTime()) {
   }
}

dba.getCluster().setPrimaryInstance('primary:3310');

sleep(2000);
var myerr = true;
while (myerr) {
  try {
    mysession = mysql.getSession('root:welcome1@localhost:6446?ssl-mode=DISABLED');
    try {
        print(mysession.runSql('select @@hostname, @@port ;').fetchAll());
        myerr = false;
    } catch (err) {
        print(err);
        myerr = true;
        mysession.close();
    }
  } catch (err1) {
        print(err1);
        myerr = true;
  }
}
mysession.runSql('create database if not exists  mytest;');
mysession.runSql('drop table if exists mytest.mytable;');
mysession.runSql('create table mytest.mytable (f1 int not null primary key, f2 varchar(200));');

mysession.startTransaction();
for(i=1;i<100001;i++) {
        var thesql = 'insert into mytest.mytable values (' + i  + ',\'abc\');';
        mysession.runSql(thesql);
}
mysession.commit();
print("switching... primary to node2");
mysession.runSql("shutdown;");
mysession.close();
myerr = true;

while (myerr) {
  try {
    mysession = mysql.getSession('root:welcome1@localhost:6446?ssl-mode=DISABLED');

    try {
        print('Getting data...');
        print(mysession.runSql('select @@hostname, @@port ;').fetchAll());
        print(mysession.runSql('select * from performance_schema.replication_group_members ;').fetchAll());
        print(mysession.runSql('select @@hostname, @@port, s.* from mytest.mytable s order by s.f1 desc limit 1;').fetchAll());
        myerr = false;
        print('Completed ...');
        try {
          mysession.runSql( 'insert into mytest.mytable values (1,\'Dupliated Key\');');
          print('This is abnormal if inserting duplicated value is valid');
        } catch (err0) {
                print('This is normal if inserting duplicated value');
                print(err0);
        }
    } catch (err) {
        print(err);
        myerr = true;
        mysession.close();
    }
  } catch (err1) {
        print(err1);
        myerr = true;
  }
}

