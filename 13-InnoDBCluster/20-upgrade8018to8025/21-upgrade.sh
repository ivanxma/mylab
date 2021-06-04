echo "Router upgrade is not part of the process"
echo "Assuming 3310 as Primary node"
echo "Press <ENTER> to continue to upgrade metadata"
read

/usr/local/shell8025/bin/mysqlsh --uri root@localhost:3310 << EOF

dba.upgradeMetadata()

EOF

# change link

rm comm.sh
ln -s ./comm8025.sh comm.sh


# restart 3330, 3320, 3310 
echo -n "Press <ENTER> to start upgrade 3330 - secondary node first"
read

mysql -uroot -h127.0.0.1 -P3330 -e "shutdown;"
sleep 20

/usr/local/mysql8025/bin/mysqld_safe --defaults-file=config8025/my3.cnf &
sleep 30

mysqlsh --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().status());"


echo -n "Press <ENTER> to continue to upgrade 3320"
read

mysql -uroot -h127.0.0.1 -P3320 -e "shutdown;"
sleep 20

/usr/local/mysql8025/bin/mysqld_safe --defaults-file=config8025/my2.cnf &
sleep 30

mysqlsh --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().status());"
echo -n "Press <ENTER> to continue to upgrade 3310"
read

mysql -uroot -h127.0.0.1 -P3310 -e "shutdown;"
sleep 20

/usr/local/mysql8025/bin/mysqld_safe --defaults-file=config8025/my1.cnf &
sleep 30

mysqlsh --uri gradmin:grpass@`hostname`:3310 -e "print(dba.getCluster().status());"






