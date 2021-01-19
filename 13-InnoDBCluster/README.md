# The InnoDB Cluster Setup
## SETUP
### Setup the comm.sh before execution

1. remove the config/gencnf.touch
2. Change the following according to the environment
`
export BRIDGE_HOST=instance-20210119-1947
export BRIDGE_CHANNEL=channel1
export BRIDGE_DRCHANNEL=drchannel1
export CLUSTER_HOST=instance-20210119-1947
export CLUSTER_IPALLOWLIST=10.0.0.0/16
export SECONDARY_HOST=ivanma-demo3
`

## 01-firsttest
- to create InnoDB Cluster of 3 nodes (3310, 3320, 3330)
- it also creates the replication user 'repl@%' with privilege assigned (clone, replication_client, backup_admin, SELECT).

## 02a-secondaryCluster & 02b-secondaryCluster
- 02a is to create Seconadry Cluster on SECONDARY_HOST using createCluster(...)
- 02b is to create Secondary Cluster on SECONDARY_HOST by extending nodes and splitting them.  So all nodes are identical.

## 03-buildReplication-DC1-DC2
- This is to build replication between 2 clusters manually by setting GTID (executed/purged) manually. 
- This is an unsupported way with FILTER setup on InnoDB Cluster

## 04-addFilterServer
- This is to add intermediate server between 2 InnoDB Clusters. 
- The intermediate server has REPLICATION FILTER
- Note : this is replaced by 06-bridgeserver

## 05-DC2-replica
- This is the Cluster2 to connect to the Intermediate Server


## 06-bridgeserver
- to create 2 servers (3306, 3316)
-  3306 pointing to Primary Node of the Cluster
-  3316 pointing to Secondary Node of the Cluster

## DR
- This is the Setup of DR (Cluster2) to bridge server(s)
- Cluster as 3340,3350,3360

