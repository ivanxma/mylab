. ./comm.sh

echo "This is on Secondary"
read
mysql -uroot -h$SECONDARY -P$MYPORT << EOL

select 'simple1\$EX', x.* from clusterdb.simple1\$EX x\G
select 'simple2\$EX', x.* from clusterdb.simple2\$EX x\G
select 'simple3\$EX', x.* from clusterdb.simple3\$EX x\G

select 'simple1', x.* from clusterdb.simple1 x\G
select 'simple2', x.* from clusterdb.simple2 x\G
select 'simple3', x.* from clusterdb.simple3 x\G
EOL
