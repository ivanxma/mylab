. ./comm.sh


echo "Killing all mysql cluster related processes and remove the mcm_data and tmp folder details from mysql cluster"
./reset.sh all

echo "Now restoring the Agent (mcmd)"
echo "Press <ENTER>"
read

if [ ! -d "~/mcm/mcm_data" ]
then
	mkdir -p ~/mcm/mcm_data
fi

cp -r ~/backup/agent_backup_demo/* ~/mcm/mcm_data


echo "Restarting mcmd"
./01-startmcmd.sh local

echo "Press <ENTER> to wait for mcmd starting..."
read

# wait until recovery finishes

while [ 1 ]
do
	sleep 1
 	mcm -e "list sites;"
	if [ $? -eq 0 ]
	then
		mcm -e "show status -r mycluster1;"
		break;
	fi
done

echo "Press <ENTER> to restart mycluster1 with --initial"
echo "Now restarting mycluster1 as --initial"
read
mcm << EOL
list sites;
stop cluster -f mycluster1;
start cluster --initial mycluster1;
EOL
echo "Press <ENTER> to stop process 49 and 54 mycluster1"
read

mcm << EOL1
stop process 49 mycluster1;
stop process 54 mycluster1;
EOL1

# Manual Remove the datadir folder of the mysqld (49 and 54)
rm -rf $HOME/mcm/mcm_data/clusters/mycluster1/49/data/*
rm -rf $HOME/mcm/mcm_data/clusters/mycluster1/54/data/*

# copy back the datadir
cp -r $HOME/backup/mysqld_backup/3316/datadir/* $HOME/mcm/mcm_data/clusters/mycluster1/49/data
cp -r $HOME/backup/mysqld_backup/3326/datadir/* $HOME/mcm/mcm_data/clusters/mycluster1/54/data

for i in `ls $HOME/backup/data_backup/`
do
	cp -r $HOME/backup/data_backup/$i/* $HOME/mcm/mcm_data/clusters/mycluster1/$i/data/
	BACKUPID=`ls $HOME/backup/data_backup/$i/BACKUP|sed -n '1 p'|cut -f2 -d-`
done

# the BACKUPID should be the same for all nodes, otherwise, there is some errors in backup
mcm << EOL2
list backups mycluster1;
start process 49 mycluster1;
start process 54 mycluster1;
restore cluster --backupid=$BACKUPID mycluster1;
EOL2

