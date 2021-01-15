. ./comm.sh

tabs 10
mcm << EOL

get *:mysqld mycluster1;

get -d ndb*:mysqld mycluster1;
EOL


tabs 15
mcm << EOL
get -d *memory*:ndbmtd:1 mycluster1;
EOL
