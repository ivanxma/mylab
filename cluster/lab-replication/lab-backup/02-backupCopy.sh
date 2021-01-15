. ./comm.sh
#set -x

mcm << EOL
backup agents;
backup cluster mycluster1;
EOL


AGENT_FOLDER=`ls -t $HOME/mcm/mcm_data/rep_backup|sed -n '1 p'`
if [ ! -d $HOME/backup ]
then
	mkdir $HOME/backup
fi

rm -rf $HOME/backup/agent_backup_demo
rm -rf $HOME/backup/data_backup
rm -rf $HOME/backup/mysqld_backup

if [ ! -d $HOME/backup/mysqld_backup ]
then
	mkdir $HOME/backup/mysqld_backup
fi

echo "Check $HOME/backup/agent_backup_demo for the Agent Backup Image"
cp -r $HOME/mcm/mcm_data/rep_backup/$AGENT_FOLDER $HOME/backup/agent_backup_demo


echo "Check $HOME/backup/data_backup for the Data Backup Image"
for i in `ls -t $HOME/mcm/mcm_data/clusters/mycluster1/*/data/BACKUP|grep data`
do
	j=`echo $i|rev|cut -f3 -d/|rev`
	BACKUPDATA=`ls -t $HOME/mcm/mcm_data/clusters/mycluster1/$j/data/BACKUP|sed -n '1 p'`
	mkdir -p $HOME/backup/data_backup/$j/BACKUP
	cp -r $HOME/mcm/mcm_data/clusters/mycluster1/$j/data/BACKUP/$BACKUPDATA $HOME/backup/data_backup/$j/BACKUP
done

echo "Backing up MySQL Node using MySQL Enterprise Backup - full backup"
mysqlbackup -uroot --host=127.0.0.1 --port=3316 --backup-dir=$HOME/backup/mysqld_backup/3316 backup-and-apply-log
mysqlbackup -uroot --host=127.0.0.1 --port=3326 --backup-dir=$HOME/backup/mysqld_backup/3326 backup-and-apply-log

ls -lR $HOME/backup|less

