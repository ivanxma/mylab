. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

alter table mydb.mytable encryption='Y';
show warnings;

EOL
