echo "3310 status"
mysql -t -uroot -h127.0.0.1 -P3310 << EOF
use mysql;

show table status like 'backup%';
select @@port,count(*) from backup_history;
select @@port, count(*) from backup_progress;

EOF

echo "********************************************"
echo "3320 status"
mysql -t -uroot -h127.0.0.1 -P3320 << EOF
use mysql;

show table status like 'backup%';
select @@port,count(*) from backup_history;
select @@port, count(*) from backup_progress;

EOF
echo "********************************************"
echo "3330 status"
mysql -t -uroot -h127.0.0.1 -P3330 << EOF
use mysql;

show table status like 'backup%';
select @@port, count(*) from backup_history;
select @@port, count(*) from backup_progress;

EOF
