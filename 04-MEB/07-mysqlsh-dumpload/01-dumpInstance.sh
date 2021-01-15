. ./comm.sh


mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

alter table hello.mytable1 engine=innodb;
alter table hello.mytable2 engine=innodb;
alter table hello.mytable3 engine=innodb;

truncate table hello.mytable1;
insert into hello.mytable1 values 
(1,'hello'),
(2,'hello'),
(3,'hello'),
(4,'hello'),
(5,'hello'),
(6,'hello'),
(7,'hello'),
(8,'hello'),
(9,'hello'),
(10,'hello');

select count(*) from hello.mytable;
EOL

MYDATE=`date +"%Y%m%d-%H%M%S"`
mkdir -p /home/mysql/shelldump/dump-$MYDATE
mysqlsh --uri root:mysql@127.0.0.1:3306 << EOF

util.dumpInstance("/home/mysql/shelldump/dump-$MYDATE", {threads:4,consistent:true})
EOF
