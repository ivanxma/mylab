. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

set foreign_key_checks=0;
truncate table mytest.mytrans;
truncate table mytest.mycustomer;
set foreign_key_checks=1;

insert into mytest.mycustomer values 
('101', 'chan tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', ''),
('102', 'wong tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', ''),
('103', 'lee tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', ''),
('104', 'li tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', ''),
('105', 'tang tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', ''),
('106', 'yeung tai man', 'addr1', 'addr2', 'ShenZhen', 'CN', '', '', '', 'ctm@test.com', '');

EOL

typeset -i mycounter=1

while [ $mycounter -lt 5 ]
do

echo -n $mycounter

mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
mysql -uroot -pmysql -h127.0.0.1 -e " insert into mytest.mytrans (txndate, custid, location, callnum) values
( adddate(subdate(sysdate(6), day(sysdate())), $mycounter), ceil(rand()*6)+100, 'GIS location', '123');
"
typeset -i mycounter=$mycounter+1

done
