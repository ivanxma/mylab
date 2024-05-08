. ./comm.sh

PASS=`grep temporary /home/mysql/data/3306/my.error |sed 's/localhost: /\~/g'|cut -f2 -d\~`

echo "The temporary password is initialized and stored in the error log - /home/mysql/data/3306/my.error"
echo "The temporary password for root@'localhost' is $PASS  "
echo "The password is changed to 'mysql'"

mysql -uroot -h127.0.0.1 -P3306 -p"$PASS"  --connect-expired-password << EOL
alter user root@'localhost' identified by 'mysql';
EOL

