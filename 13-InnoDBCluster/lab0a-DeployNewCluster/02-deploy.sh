. ./comm.sh

mysqlsh --js << EOL

dba.deploySandboxInstance(3310, {password:"welcome1"});


EOL

echo "Please check the $HOME/mysql-sandboxes folder"
ls -l $HOME/mysql-sandboxes
