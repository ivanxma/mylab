mysql -uroot -h127.0.0.1 -P3310 << EOF
use mysql;

select "BEFORE", count(*) from backup_history;
select "BEFORE", count(*) from backup_progress;

insert into backup_history
select *,0 from backup_history_oldcopy;

select "AFTER", count(*) from backup_history;
select "AFTER", count(*) from backup_progress;

EOF

echo "Now clean up the oldcopy tables"
echo "Press <ENTER> to continue"
read

mysql -uroot -h127.0.0.1 -P3310 << EOF
use mysql;
drop table if exists backup_history_oldcopy;
drop table if exists backup_progress_oldcopy;
drop table if exists backup_progress_newcopy;;

show tables like 'backup%';

EOF
