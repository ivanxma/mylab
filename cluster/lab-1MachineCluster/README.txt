The demo is written to create MySQL CLuster 'mycluster1' on 1 machines 

A site(mysite) with 2 hosts will be created named 'primary' and 'secondary'.

On primary host, 'mycluster1' is created with
	
	1 x mysqld  (Port 3316)
	2 x ndbd
	1 x ndb_mgmd


Commands Description
01-startmcmd.sh
	This script starts the "mcmd" on local
02-createCluster.sh
	This script will create MySQL Cluster "mycluster1" using MySQL Cluster Manager.
	The "mycluster1" containers services for the 1 machines
03-startCluster.sh
	This script will start the "mycluster1".
04-createData.sh
	This script create test.mytable with 7 rows of data. 
	It also describe the data distribution using ndb_desc.
05-insert.sh
	This script create test.mytable2 with 1000 rows of data. 
	It also describe the data distribution using ndb_desc.


Pre-requisite for the setup on 1 machines (or VMs)
0. setup "mysql" account 
1. Untar this folder to primary.    
1. Installation of MCM (assuming 8.0.30)
	/home/mysql/mcm/mcm8.0.30
2. Installation of MySLQ Cluster
	/home/mysql/mcm/cluster-latest
3. setup /etc/hosts with 
	<your primary ip>	primary
	<your secondary ip>	secondary
4. setup trusted user for mysql on both machine (primary and secondary)
	- to allow ssh login for mysql user on both hosts without asking passwd
5. Change the setting of comm.sh if necessary to point to the installation folder
	MCM_PATH
	MYSQL_PATH


