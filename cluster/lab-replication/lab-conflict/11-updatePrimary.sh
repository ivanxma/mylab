. ./comm.sh
mysql -uroot -h$PRIMARY -P$MYPORT << EOL

select 'Before', x.* from clusterdb.simple1 x;
update clusterdb.simple1 set value=13 where id=1;
select 'Updated', x.* from clusterdb.simple1 x;

EOL
