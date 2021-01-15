if [ $USER != 'root' ]
then
        echo "Please stop it with root"
else
	systemctl stop mysqld
	sleep 5
	systemctl status mysqld
fi
