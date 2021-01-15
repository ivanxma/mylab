The demo is written to demonstration MySQL Cluster to MySQL Cluster Replication using MySQL Cluster Manager.

A site(mysite) with 2 hosts will be created named 'primary' and 'secondary'.

On primary host, 'mycluster1' is created with
	1 x mysqld  (Port 3316)
	2 x ndbd
	1 x ndb_mgmd

On seondary host, 'mycluster2' is created with
	1 x mysqld  (Port 3316)
	2 x ndbd
	1 x ndb_mgmd

Additional mysqld will be added to each host with PORT 3326.
MySQL Cluster Manager is used to add the newly created mysqld configuration.

Pre-requisite for the setup on 2 machines (or VMs)
0. setup "mysql" account on both hosts, and home directory must be the same.  
1. Untar this folder to primary.    
1. Installation of MCM (assuming 1.3.6/1.4.0)
	/home/mysql/mcm/mcm1.3.6
	/home/mysql/mcm/mcm1.4.0
2. Installation of MySLQ Cluster (Create a soft link to your corresponding cluster binary)
	/home/mysql/mcm/cluster_latest
3. setup /etc/hosts with 
	<your primary ip>	primary
	<your secondary ip>	secondary
4. setup trusted user for mysql on both machine (primary and secondary)
	- to allow ssh login for mysql user on both hosts without asking passwd
5. Change the setting of comm.sh if necessary to point to the installation folder
	MCM_PATH
	MYSQL_PATH  (This is the cluster binary installation)


