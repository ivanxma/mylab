if [ $USER != 'root' ]
then
        echo "Please start it with root"
else
	systemctl start mysqld
	sleep 5
	systemctl status mysqld
fi
