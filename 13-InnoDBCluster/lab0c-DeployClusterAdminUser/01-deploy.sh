. ./comm.sh

MYDIR=`pwd`
PGM=`basename $0`

mkdir -p /home/mysql/data/sandbox

mysqlsh << EOL1
dba.killSandboxInstance(3310,{sandboxDir:"/home/mysql/data/sandbox"});
EOL1
mysqlsh << EOL2
dba.killSandboxInstance(3320,{sandboxDir:"/home/mysql/data/sandbox"});
EOL2
mysqlsh << EOL3
dba.killSandboxInstance(3330,{sandboxDir:"/home/mysql/data/sandbox"});
EOL3

mysqlsh --js < deploy01.sc

