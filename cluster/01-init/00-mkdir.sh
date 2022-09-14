mkdir -p /home/mysql/mycluster/
mkdir -p /home/mysql/mycluster/mgm01/ndb_data
mkdir -p /home/mysql/mycluster/mgm02/ndb_data
mkdir -p /home/mysql/mycluster/ndb01/ndb_data
mkdir -p /home/mysql/mycluster/ndb02/ndb_data
mkdir -p /home/mysql/mycluster/conf
mkdir -p /home/mysql/mycluster/mysql150/mysql_data

# for lab purpose - to stop mysqld running
sudo systemctl stop mysqld
sudo systemctl stop mysqld@mysql01
sudo systemctl stop mysqld@mysql02
sudo systemctl stop mysqld@mysql03
