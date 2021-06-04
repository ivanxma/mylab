mysql -uroot -h127.0.0.1 -P3310 << EOL
DROP USER if exists 'mysqlbackup'@'localhost';
DROP USER if exists 'mysqlbackup'@'%';
CREATE USER 'mysqlbackup'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, BACKUP_ADMIN, RELOAD, PROCESS, SUPER, REPLICATION CLIENT ON *.* TO 'mysqlbackup'@'localhost';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_progress TO 'mysqlbackup'@'localhost'; 
GRANT CREATE, INSERT, DROP, UPDATE, SELECT, ALTER ON mysql.backup_history TO 'mysqlbackup'@'localhost';
GRANT LOCK TABLES, CREATE, DROP, FILE ON *.* TO 'mysqlbackup'@'localhost';
GRANT CREATE, INSERT, DROP, UPDATE ON mysql.backup_sbt_history TO 'mysqlbackup'@'localhost';
GRANT ENCRYPTION_KEY_ADMIN ON *.* TO 'mysqlbackup'@'localhost';
GRANT INNODB_REDO_LOG_ARCHIVE ON *.* TO 'mysqlbackup'@'localhost';
rename user 'mysqlbackup'@'localhost' to 'mysqlbackup'@'%';
EOL
