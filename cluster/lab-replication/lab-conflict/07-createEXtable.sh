. ./comm.sh

mysql -uroot -h$PRIMARY -P$MYPORT  << EOL

CREATE DATABASE if not exists clusterdb;

USE clusterdb;

CREATE TABLE if not exists simple1\$EX (
	NDB\$server_id INT UNSIGNED,
	NDB\$master_server_id INT UNSIGNED,
	NDB\$master_epoch BIGINT UNSIGNED,
	NDB\$count INT UNSIGNED,
	NDB\$OP_TYPE ENUM('WRITE_ROW','UPDATE_ROW', 'DELETE_ROW', 'REFRESH_ROW', 'READ_ROW') NOT NULL,
	NDB\$CFT_CAUSE ENUM('ROW_DOES_NOT_EXIST', 'ROW_ALREADY_EXISTS', 'DATA_IN_CONFLICT', 'TRANS_IN_CONFLICT') NOT NULL,
	NDB\$ORIG_TRANSID BIGINT UNSIGNED NOT NULL,
	id INT NOT NULL,
	value\$OLD INT,
	value\$NEW INT,
	PRIMARY KEY(NDB\$server_id, NDB\$master_server_id, NDB\$master_epoch, NDB\$count)
) ENGINE=NDB;

CREATE TABLE if not exists simple2\$EX (
	NDB\$server_id INT UNSIGNED,
	NDB\$master_server_id INT UNSIGNED,
	NDB\$master_epoch BIGINT UNSIGNED,
	NDB\$count INT UNSIGNED,
	NDB\$OP_TYPE ENUM('WRITE_ROW','UPDATE_ROW', 'DELETE_ROW', 'REFRESH_ROW', 'READ_ROW') NOT NULL,
	NDB\$CFT_CAUSE ENUM('ROW_DOES_NOT_EXIST', 'ROW_ALREADY_EXISTS', 'DATA_IN_CONFLICT', 'TRANS_IN_CONFLICT') NOT NULL,
	NDB\$ORIG_TRANSID BIGINT UNSIGNED NOT NULL,
	id INT NOT NULL,
	value\$OLD INT,
	value\$NEW INT,
	PRIMARY KEY(NDB\$server_id, NDB\$master_server_id, NDB\$master_epoch, NDB\$count)
) ENGINE=NDB;

CREATE TABLE if not exists simple3\$EX (
	NDB\$server_id INT UNSIGNED,
	NDB\$master_server_id INT UNSIGNED,
	NDB\$master_epoch BIGINT UNSIGNED,
	NDB\$count INT UNSIGNED,
	NDB\$OP_TYPE ENUM('WRITE_ROW','UPDATE_ROW', 'DELETE_ROW', 'REFRESH_ROW', 'READ_ROW') NOT NULL,
	NDB\$CFT_CAUSE ENUM('ROW_DOES_NOT_EXIST', 'ROW_ALREADY_EXISTS', 'DATA_IN_CONFLICT', 'TRANS_IN_CONFLICT') NOT NULL,
	NDB\$ORIG_TRANSID BIGINT UNSIGNED NOT NULL,
	id INT NOT NULL,
	value\$OLD INT,
	value\$NEW INT,
	PRIMARY KEY(NDB\$server_id, NDB\$master_server_id, NDB\$master_epoch, NDB\$count)
) ENGINE=NDB;

show tables;
show create table simple1\$EX;
show create table simple2\$EX;
show create table simple3\$EX;
EOL
