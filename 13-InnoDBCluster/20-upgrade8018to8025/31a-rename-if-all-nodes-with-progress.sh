echo "Rename those backup tables so that the mysqlbackup (8.0.25) will create new backup table structure with InnoDB storage engine"
echo "Later on, the data will be inserted back to the new created table from 8.0.25"
echo "Press <ENTER> to continue"
read

mysql -uroot -h127.0.0.1 -P3310 << EOF

use mysql;

rename table backup_history to backup_history_oldcopy;
rename table backup_progress to backup_progress_oldcopy;

show tables like 'backup%';


EOF
