./comm.sh
mysql -uroot -h$PRIMARY -P$MYPORT << EOL1

truncate table clusterdb.simple1;
truncate table clusterdb.simple2;
truncate table clusterdb.simple3;

INSERT INTO clusterdb.simple1 VALUES (1,10);
INSERT INTO clusterdb.simple2 VALUES (1,10);
INSERT INTO clusterdb.simple3 VALUES (1,10);

EOL1

sleep 2

mysql -uroot -h$SECONDARY -P$MYPORT << EOL2

select @@hostname, x.* from clusterdb.simple1 x;
select @@hostname, x.* from clusterdb.simple2 x;
select @@hostname, x.* from clusterdb.simple3 x;

EOL2
