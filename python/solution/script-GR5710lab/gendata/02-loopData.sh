. ../comm.sh
touch removeMeToStop.txt
while [ -f removeMeToStop.txt ]
do
mysql -uroot -h127.0.0.1 << EOL

insert into mytest.mytable (f2) values ( 'gendata 01');
insert into mytest.mytable (f2) values ( 'gendata 01');
insert into mytest.mytable (f2) values ( 'gendata 01');
insert into mytest.mytable (f2) values ( 'gendata 01');

EOL
done
