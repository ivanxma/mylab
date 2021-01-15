. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL

call mysql.sp_set_firewall_mode("user1@localhost", 'detecting');

EOL
