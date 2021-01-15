. ./comm.sh

mysql -uroot -h$SECONDARY -P$MYPORT << EOL

select 'before', x.* from clusterdb.simple1 x;
select 'before', x.* from clusterdb.simple2 x;
select 'before', x.* from clusterdb.simple3 x;
begin;
update clusterdb.simple1 set value=20 where id=1;
update clusterdb.simple2 set value=20 where id=1;
commit;
update clusterdb.simple3 set value=20 where id=1;
select 'after', x.* from clusterdb.simple1 x;
select 'after', x.* from clusterdb.simple2 x;
select 'after', x.* from clusterdb.simple3 x;

EOL
