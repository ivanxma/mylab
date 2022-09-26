PGM=`basename $0`
. ./00-env.sh
if [ $# -ne 1 ]
then
	echo "$PGM appname"
	exit
fi

eval fn create app $1 --annotation oracle.com/oci/subnetIds='[\"$SUBNET2_ID\",\"$SUBNET1_ID\"]'
mkdir $1
cd $1
fn init --runtime node faas-demo-func-1
cd faas-demo-func-1
fn deploy --app $1
