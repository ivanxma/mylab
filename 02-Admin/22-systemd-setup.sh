. ./comm.sh

# Note : the service files : etc/systemd/system/my1.service and etc/systemd/system/my1@.service
#	they are just COPIED from RPM installation 
#	RPM installation : service files are located under 
#		/usr/lib/systemd/system/mysqld.service
#		/usr/lib/systemd/system/mysqld@.service
#	BUT it is changed (a little bit) about the path and commented the pre script!
#	the etc/my.cnf is configured with default my1/my2/my3 service!
#	

sudo cp -r etc/* /etc/

sudo systemctl daemon-reload
