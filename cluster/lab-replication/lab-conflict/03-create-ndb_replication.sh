. ./comm.sh

mysql -uroot -h127.0.0.1 -P$MYPORT <<EOL

drop table if exists mysql.ndb_replication;

create table mysql.ndb_replication(
	db varbinary(63),
	table_name varbinary(63),
	server_id int unsigned,
	binlog_type int unsigned,
	conflict_fn varbinary(128),
	primary key using HASH(db, table_name, server_id)
) engine=ndb
partition by key(db,table_name);

INSERT INTO mysql.ndb_replication VALUES ('clusterdb', 'simple1', 0, 0,  'NDB\$EPOCH2_TRANS()');
INSERT INTO mysql.ndb_replication VALUES ('clusterdb', 'simple2', 0, 0,'NDB\$EPOCH2_TRANS()');
INSERT INTO mysql.ndb_replication VALUES ('clusterdb', 'simple3', 0, 0,'NDB\$EPOCH2_TRANS()');

EOL

sleep 3

mysql -uroot -h$SECONDARY  -P$MYPORT  <<EOL2

select * from mysql.ndb_replication;

EOL2
