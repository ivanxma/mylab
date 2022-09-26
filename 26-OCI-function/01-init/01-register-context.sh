PGM=`basename $0`
. ./00-env.sh

if [ $# -ne 1 ]
then
	echo "$PGM contextname"
	exit
fi
fn list context
fn create context $1 --provider oracle
fn use context $1
fn update context oracle.compartment-id $COMPARTMENT_ID
fn update context api-url https://functions.us-ashburn-1.oraclecloud.com
fn update context registry iad.ocir.io/idazzjlcjqzj/ivanmafaas
fn update context oracle.profile DEFAULT  
fn list context
