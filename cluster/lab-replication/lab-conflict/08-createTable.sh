. ./comm.sh
mysql -uroot -h$PRIMARY  -P$MYPORT << EOL

drop table if exists clusterdb.simple1;
drop table if exists clusterdb.simple2;
drop table if exists clusterdb.simple3;

CREATE TABLE clusterdb.simple1 (id INT NOT NULL PRIMARY KEY, value INT) ENGINE=ndb;
CREATE TABLE clusterdb.simple2 (id INT NOT NULL PRIMARY KEY, value INT) ENGINE=ndb;
CREATE TABLE clusterdb.simple3 (id INT NOT NULL PRIMARY KEY, value INT) ENGINE=ndb;

show create table clusterdb.simple1\G
show create table clusterdb.simple2\G
show create table clusterdb.simple3\G
EOL
