. ./comm.sh

mysql -t -uroot -h127.0.0.1 -P3326 << EOL1

show databases;

use test1;
select 'test1.mytable1', mytable1.* from mytable1;

EOL1


