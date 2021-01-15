The demo is written to create MySQL CLuster 'mycluster1' on 2 machines 

A site(mysite) with 2 hosts will be created named 'primary' and 'secondary'.

On primary host, 'mycluster1' is created with
	
	1 x mysqld  (Port 3316)
	1 x ndbd
	1 x ndb_mgmd

On seondary host, 'mycluster2' is created with
	1 x mysqld  (Port 3316)
	1 x ndbd
	1 x ndb_mgmd


Commands Description
01-startmcmd.sh
	This script will copy required scripts to "Secondary" machine and start the "mcmd" on local and secondary machines
02-createCluster.sh
	This script will create MySQL Cluster "mycluster1" using MySQL Cluster Manager.
	The "mycluster1" containers services for the 2 machines
03-startCluster.sh
	This script will start the "mycluster1".
04-createData.sh
	This script create test.mytable with 7 rows of data. 
	It also describe the data distribution using ndb_desc.
05-insert.sh
	This script create test.mytable2 with 1000 rows of data. 
	It also describe the data distribution using ndb_desc.
06-showDataOnSecondary
	This script logon to Secondary host and list the data from the secondary node.


Pre-requisite for the setup on 2 machines (or VMs)
0. setup "mysql" account on both hosts, and home directory must be the same.  
1. Untar this folder to primary.    
1. Installation of MCM (assuming 1.3.6)
	/home/mysql/mcm/mcm1.3.6
2. Installation of MySLQ Cluster
	/home/mysql/mcm/cluster747
3. setup /etc/hosts with 
	<your primary ip>	primary
	<your secondary ip>	secondary
4. setup trusted user for mysql on both machine (primary and secondary)
	- to allow ssh login for mysql user on both hosts without asking passwd
5. Change the setting of comm.sh if necessary to point to the installation folder
	MCM_PATH
	MYSQL_PATH


