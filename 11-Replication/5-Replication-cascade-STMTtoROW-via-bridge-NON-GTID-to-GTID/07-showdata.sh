. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3316  -e "select @@port, count(*) from test1.mytable1;"
mysql -t -uroot -h127.0.0.1 -P3326  -e "select @@port, count(*) from test1.mytable1;"
mysql -t -uroot -h127.0.0.1 -P3336  -e "select @@port, count(*) from test1.mytable1;"



