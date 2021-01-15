. ./comm.sh
mcm << EOL
backup cluster mycluster1;
list backups -a mycluster1;

backup agents;
EOL
