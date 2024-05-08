. ./comm.sh

mysqlsh --js << EOL

dba.stopSandboxInstance(3310, {password:"welcome1"});

EOL
