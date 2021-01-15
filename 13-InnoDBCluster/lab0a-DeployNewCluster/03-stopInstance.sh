. ./comm.sh

mysqlsh << EOL

dba.stopSandboxInstance(3310, {password:"welcome1"});

EOL
