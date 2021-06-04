mysql -uroot -h127.0.0.1 -P3310 << EOF
use mysql;

select "BEFORE", count(*) from backup_history;
select "BEFORE", count(*) from backup_progress;

insert into backup_history
select 0,* from backup_history_oldcopy;

insert into backup_progress  (backup_id, tool_name, error_code, error_message, `current_time`, current_state) 
select * from backup_progress_newcopy;

select "AFTER", count(*) from backup_history;
select "AFTER", count(*) from backup_progress;

EOF

echo "Now clean up the oldcopy tables"
echo "Press <ENTER> to continue"
read

mysql -uroot -h127.0.0.1 -P3310 << EOF
use mysql;
drop table backup_history_oldcopy;
drop table backup_progress_oldcopy;
drop table backup_progress_newcopy;;

show tables like 'backup%';

EOF
