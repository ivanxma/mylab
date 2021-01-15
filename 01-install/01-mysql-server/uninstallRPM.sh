#Table 2.9 RPM Packages for the MySQL Enterprise Edition
#Package Name 	Summary
#mysql-commercial-backup 	MySQL Enterprise Backup (added in 8.0.13)
#mysql-commercial-client 	MySQL client applications and tools
#mysql-commercial-common 	Common files for server and client libraries
#mysql-commercial-devel 	Development header files and libraries for MySQL database client applications
#mysql-commercial-embedded-compat 	MySQL server as an embedded library with compatibility for applications using version 18 of the library
#mysql-commercial-libs 	Shared libraries for MySQL database client applications
#mysql-commercial-libs-compat 	Shared compatibility libraries for previous MySQL installations; the version of the libraries matches the version of the libraries installed by default by the distribution you are using
#mysql-commercial-minimal-debuginfo 	Debug information for package mysql-commercial-server-minimal; useful when developing applications that use this package or when debugging this package
#mysql-commercial-server 	Database server and related tools
#mysql-commercial-server-minimal 	Minimal installation of the database server and related tools (added in 8.0.0)
#mysql-commercial-test 	Test suite for the MySQL server

if [ $USER != 'root' ]
then
        echo "Please install it with root"
else
	cd /opt/download/mysql/mysql8.0/rpm

	MYPACK=""
	for i in `rpm -qa|grep mysql-commercial`
	do
		MYPACK="$MYPACK $i"
	done
	echo $MYPACK
	if [ "$MYPACK" != "" ]
	then
		rpm -e $MYPACK
	else
		echo "No more MySQL Commercial Package to be removed"
	fi

	echo ".....  Install MySQL Service <No more mysql service output>......"
	systemctl list-unit-files|grep mysql

	echo "mysql startup config at /etc/my.cnf should also be removed"
	ls -l /etc/my.cnf
	
	echo "Data resides on /var/lib/mysql"

	read -p "Do you want to remove the data folder /var/lib/mysql (Y/N)? " opt
	if [ $opt == "Y" ]
	then
		rm -rf /var/lib/mysql
	fi
fi
