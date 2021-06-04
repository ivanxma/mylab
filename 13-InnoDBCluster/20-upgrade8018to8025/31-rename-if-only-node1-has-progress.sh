echo "Rename those backup tables so that the mysqlbackup (8.0.25) will create new backup table structure with InnoDB storage engine"
echo "Later on, the data will be inserted back to the new created table from 8.0.25"
echo "Press <ENTER> to continue"
read

mysql -uroot -h127.0.0.1 -P3310 << EOF

use mysql;

set sql_log_bin=1;
rename table backup_history to backup_history_oldcopy;

set sql_log_bin=0;
create table backup_progress_newcopy like backup_progress;
alter table backup_progress_newcopy engine=innodb;
alter table backup_progress_newcopy add id int not null auto_increment invisible primary key;

rename table backup_progress to backup_progress_oldcopy;
insert into backup_progress_newcopy (backup_id, tool_name, error_code, error_message, \`current_time\`, current_state) 
select * from backup_progress_oldcopy;

show tables like 'backup%';


EOF
