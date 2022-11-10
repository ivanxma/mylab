PGM=`basename $0`
if [ $# -lt 1 ]
then
	echo "$PGM <folder>"
	echo "the <folder> is a new folder which is to be created"
	exit
fi

if [ -d "$1" ]
then
	echo "Folder $1 exists.  The folder is to be created and must not exist."
	exit
fi
mkdir $1
cd $1

cp ../template/* .
sed  "s/MYHOST/$1/g" template/myopenssl.cnf > myopenssl.cnf
openssl req -newkey rsa:2048 -days 3600         -nodes -keyout server-key.pem -out server-req.pem -config myopenssl.cnf 
openssl x509 -req -in ./server-req.pem -days 3600         -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

openssl req -newkey rsa:2048 -days 3600         -nodes -keyout client-key.pem -out client-req.pem -config myopenssl.cnf 
openssl x509 -req -in ./client-req.pem -days 3600         -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem
