if [ -d /var/www/html ]
then
	mv demo /var/www/html
	mv restaurant /var/www/html
else
	echo "directory /var/www/html is not there"
fi

tail -6 $0
#
# 1. change the mysql root user if needed
# 2. create database docstore
# 3. change the /etc/php.ini with
#	 short_open_tag=1
#
