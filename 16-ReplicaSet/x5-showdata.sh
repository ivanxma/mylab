. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3310  -e "select @@port, count(*) from test1.mytable1;"
mysql -t -uroot -h127.0.0.1 -P3320  -e "select @@port, count(*) from test1.mytable1;"
mysql -t -uroot -h127.0.0.1 -P3330  -e "select @@port, count(*) from test1.mytable1;"



