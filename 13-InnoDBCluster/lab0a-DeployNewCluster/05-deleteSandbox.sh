. ./comm.sh

pkill -9 mysqld
for i in `ls -1 $HOME/mysql-sandboxes`
do
	
mysqlsh --js << EOL

dba.deleteSandboxInstance($i);

EOL
done

ls -l $HOME/mysql-sandboxes
