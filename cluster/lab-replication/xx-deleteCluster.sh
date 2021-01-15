. ./comm.sh
mcm << EOL1a
list sites;
stop cluster mycluster1;
stop cluster mycluster2;
EOL1a

mcm << EOL1b
delete cluster mycluster1;
delete cluster mycluster2;
EOL1b

mcm << EOL2
delete package cluster.pkg;
EOL2

mcm << EOL3
delete site mysite;
EOL3

mcm << EOL
list sites;
EOL
