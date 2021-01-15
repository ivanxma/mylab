
This is the DEMO script for MySQL Group Replication
*******************************************************
Assuming 'mysql' user
	/home/mysql  HOME folder for user mysql
	/home/mysql/demo : The Group Replication Demo  
	/etc/hosts : contain 'primary' and 'secondary' 
		as 2 hosts running Group Replication  (only if 2 machines are used)


*******************************************************
00-createdb.sh  
	Create 2 Databases (3306, 3316)
		Datadir on /home/mysql/data/ and /home/mysql/data2
		Please check the config/my.cnf and config/my2.cnf
01-startdb.sh
	Startup 2 databases (3306, 3316) using 
		config : config/my.cnf and config/my2.cnf
02-mysqlupgrade.sh
	No Use : ONLY if mysql_upgrade is needed
03-createRpl.sh
	Create rpl_user with password rpl_pass
	grant replication slave to the user

04-restart-with-gcs.sh
	Shutdown the configured mysqld and 
	Restart mysqld with plugin loaded

##########################################################


********************************************
The following are the script files to generate data 
gendata.sh
	To create a database if not exists mytest
	To create the table if not exists mytable 
	
	while the file (removeToStop.txt) exists
	BEGIN
		INSERT data via 3306
		INSERT data via 3316
	END
********************************************

To check the status of the GROUP REPLICATION
xx-chkgcs.sh <port# on the 127.0.0.1>
e.g. 
	# ./xx-chkgcs.sh 3306
********************************************
