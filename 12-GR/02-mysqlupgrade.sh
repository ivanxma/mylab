. ./comm.sh
# only if it is with MySQL 5.7 and we can do upgrade checking with MySQL Shell

echo "Upgrade Checking only with MySQL 5.7 to MySQL 8.0"
echo "This is only a demonstration for the util package with MySQL Shell"
echo "*******************************************************************"

mysqlsh --js root@127.0.0.1:3306 -e "util.checkForServerUpgrade();"
mysqlsh --js root@127.0.0.1:3316 -e "util.checkForServerUpgrade();"
mysqlsh --js root@127.0.0.1:3326 -e "util.checkForServerUpgrade();"



#mysql_upgrade -uroot -h127.0.0.1 -P3306
#mysql_upgrade -uroot -h127.0.0.1 -P3316
#mysql_upgrade -uroot -h127.0.0.1 -P3326
