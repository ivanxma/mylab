mysql --login-path=root -h127.0.0.1 <<EOF
drop table if exists test.customer;
create table test.customer (custid int not null primary key, firstname varchar(30), lastname varchar(30), telno varchar(20), ccnum varchar(1024)) engine=innodb;

insert into test.customer (custid, firstname, lastname, telno) values (1, 'John', 'Chan', '91234567');
insert into test.customer (custid, firstname, lastname, telno) values (2, 'May', 'Chan', '97654321');
insert into test.customer (custid, firstname, lastname, telno) values (3, 'Eva', 'Wong', '88812345');

select pub_key into @pub from test.mykey where kid=1;
update test.customer set ccnum=hex(asymmetric_encrypt('RSA', '1111-2222-3333-4444', @pub)) where custid=1;
update test.customer set ccnum=hex(asymmetric_encrypt('RSA', '8888-2222-3333-4444', @pub)) where custid=2;
update test.customer set ccnum=hex(asymmetric_encrypt('RSA', '9999-2222-3333-4444', @pub)) where custid=3;

select custid, firstname, lastname, telno, left(ccnum,10),length(ccnum) from test.customer;

EOF
