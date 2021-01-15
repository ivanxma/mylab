. ./comm.sh

mysql -uroot -h127.0.0.1 << EOL

create database if not exists mytest;

CREATE LOGFILE GROUP lg_1
    ADD UNDOFILE 'undo_1.log'
    INITIAL_SIZE 16M
    UNDO_BUFFER_SIZE 2M
    ENGINE NDBCLUSTER;

ALTER LOGFILE GROUP lg_1
    ADD UNDOFILE 'undo_2.log'
    INITIAL_SIZE 12M
    ENGINE NDBCLUSTER;

CREATE TABLESPACE ts_1
    ADD DATAFILE 'data_1.dat'
    USE LOGFILE GROUP lg_1
    INITIAL_SIZE 16M
    ENGINE NDBCLUSTER;

ALTER TABLESPACE ts_1
    ADD DATAFILE 'data_2.dat'
    INITIAL_SIZE 16M
    ENGINE NDBCLUSTER;

EOL

mysql -uroot -h127.0.0.1 << EOL1

CREATE TABLE mytest.phonebook (
    member_id char(32) not null,
    contact_id char(32) not null,
    phone_name varchar(800) null,
    dob DATE NOT NULL,
    joined DATE NOT NULL,
    primary key (member_id, contact_id)
    )
    TABLESPACE ts_1 STORAGE DISK
    ENGINE NDBCLUSTER;


EOL1

ndb_desc -d mytest phonebook
