. ./comm.sh

echo "This is on Primary"
read
mysql -uroot -h$PRIMARY -P$MYPORT << EOL

select 'simple1\$EX', x.* from clusterdb.simple1\$EX x\G
select 'simple2\$EX', x.* from clusterdb.simple2\$EX x\G
select 'simple3\$EX', x.* from clusterdb.simple3\$EX x\G

EOL
