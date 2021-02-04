#This folder is intended to be executed on 'secondary' hostname
1. Assuming the Primary = Secondary
   Innodb Cluster is created on Primary
   Innodb Cluster is created on Secondary
   If they are not the 'clone' or 'backup', basically the are different.
   GTID set is different before Primary and Secondary

   The Primary and Secondary InnoDB Clusters are basically - only system data, no User Data.   Setting up Replication at this point is to ignore any previous system-wide data such as those innodb cluster configuration.

2. On Primary - Get the gtid_executed
   On Secondary - Set the global gtid_purged on SLAVE 

3. On Primary - Create Replication User and Granted with privileges

4. On Secondary, 
   use 'CHANGE MASTER to' to connect Replication (using CHANNEL 'channel1')
   use 'CHANGE REPLICATION FILTER REPLICATE_IGNORE_DB = (mysql_innodb_cluster_metadata) for CHANNEL 'channel1';


Note : 
a. the CHANGE REPLICATION FILTER which is dynamic.  To persist, my.cnf should be changed.  Otherwise, on server restart the FILTER is gone.
b. the skip_slave_start should be added to my.cnf for "SLAVE" with GROUP REPLICATION.
c. the SLAVE must be started "manually"  or EVENT should be created to start the REPLICATION.  Alternatively, creating CRON job to monitor what to do when the server is PRIMARY Server and slave can be started.