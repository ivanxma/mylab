. ./comm.sh
$MYSQL_HOME/bin/mysql -t -uroot -h127.0.0.1 -P3306 << EOL
source /usr/local/mysql/share/linux_install_firewall.sql
SHOW GLOBAL VARIABLES LIKE 'mysql_firewall_mode';
CREATE USER 'fwadmdemo'@'localhost' IDENTIFIED BY 'password';
GRANT FIREWALL_ADMIN ON *.* TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_reload_firewall_group_rules TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_reload_firewall_rules TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_set_firewall_group_mode TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_set_firewall_group_mode_and_user TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_set_firewall_mode TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_firewall_group_enlist TO 'fwadmdemo'@'localhost';
GRANT EXECUTE ON PROCEDURE mysql.sp_firewall_group_delist TO 'fwadmdemo'@'localhost';
SHOW GRANTS FOR 'fwadmdemo'@'localhost';
EOL
