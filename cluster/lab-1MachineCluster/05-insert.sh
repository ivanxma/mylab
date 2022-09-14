. ./comm.sh
tabs 10
#Do some transaction
#create table
#insert ...
#	showing data is in the data nodes

mysql -uroot -h127.0.0.1 -P3316 << EOL

drop table if exists test.mytable2 ;
create table test.mytable2 ( f1 int not null primary key, f2 varchar(20)) engine=ndb partition by key(f1);
EOL

declare -i x=1

while [ $x -le 1000 ]
do
mysql  -uroot -h127.0.0.1 -P3316  << EOL1

	insert into test.mytable2  values ( $x, 'hello');

EOL1
x=$(( x + 1 ))
done


mysql  -uroot -h127.0.0.1 -P3316 << EOL2
select * from test.mytable2 order by f1 desc limit 10;
select count(*) from test.mytable2;
show global status like 'ndb_pruned%';

-- explain partitions select * from test.mytable2 where f1=20;
explain select * from test.mytable2 where f1=20\G
select * from test.mytable2 where f1=20;
show global status like 'ndb_pruned%';
EOL2
echo "Press <ENTER> to continue"
read

ndb_desc -c $PRIMARY -d test -p mytable2

