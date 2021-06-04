GRANT ALTER ON mysql.backup_progress TO 'mysqlbackup'@'%';
GRANT CREATE, INSERT, DROP ON mysql.backup_progress_new TO 'mysqlbackup'@'%';
GRANT CREATE, INSERT, DROP ON mysql.backup_progress_old TO 'mysqlbackup'@'%';
GRANT CREATE, INSERT, DROP, ALTER ON mysql.backup_progress_new TO 'mysqlbackup'@'%';

GRANT CREATE, INSERT, DROP ON mysql.backup_history_old TO 'mysqlbackup'@'%';
GRANT CREATE, INSERT, DROP, ALTER ON mysql.backup_history_new TO 'mysqlbackup'@'%';
