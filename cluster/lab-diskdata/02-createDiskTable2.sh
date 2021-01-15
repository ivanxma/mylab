. ./comm.sh

mysql -uroot -h127.0.0.1 << EOL

create database if not exists mytest;

drop table if exists mytest.phonebook2;

alter tablespace ts_2 
drop datafile 'data2_2.dat'
engine ndbcluster;

alter tablespace ts_2 
drop datafile 'data2_1.dat'
engine ndbcluster;

drop tablespace ts_2 engine=ndbcluster;

CREATE TABLESPACE  ts_2
    ADD DATAFILE 'data2_1.dat'
    USE LOGFILE GROUP lg_1
    INITIAL_SIZE 16M
    ENGINE NDBCLUSTER;

ALTER TABLESPACE ts_2
    ADD DATAFILE 'data2_2.dat'
    INITIAL_SIZE 16M
    ENGINE NDBCLUSTER;

EOL

mysql -uroot -h127.0.0.1 << EOL1

drop table if exists mytest.phonebook2;

CREATE TABLE mytest.phonebook2 (
    member_id char(32) not null,
    contact_id char(32) not null,
    phone_name varchar(800) null storage disk,
    phone_other varchar(50) null,
    dob DATE NOT NULL,
    joined DATE NOT NULL,
    primary key (member_id, contact_id)
    )
    tablespace ts_2
    ENGINE NDBCLUSTER;


EOL1

ndb_desc -d mytest phonebook2
