. ./comm.sh

# assumed $HOST1/$HOST2/$HOST3 defined in comm.sh

TMPFLDR=/tmp/certs.$$
mkdir -p $TMPFLDR

if [ "$HOST1" == "$HOSTNAME" ]
then

  cat << EOF > $TMPFLDR/ca.cnf
# OpenSSL CA configuration file
[ ca ]
default_ca = CA_default

[ CA_default ]
default_days = 3650
database = index.txt
serial = serial.txt
default_md = sha256
copy_extensions = copy
unique_subject = no

# Used to create the CA certificate.
[ req ]
prompt=no
distinguished_name = distinguished_name
x509_extensions = extensions

[ distinguished_name ]
organizationName = MySQL
commonName = MySQL

[ extensions ]
keyUsage = critical,digitalSignature,nonRepudiation,keyEncipherment,keyCertSign
basicConstraints = critical,CA:true,pathlen:1

# Common policy for nodes and users.
[ signing_policy ]
organizationName = supplied
commonName = optional

# Used to sign node certificates.
[ signing_node_req ]
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = serverAuth,clientAuth

# Used to sign client certificates.
[ signing_client_req ]
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth
EOF

  openssl genrsa 2048 > $TMPFLDR/ca-key.pem
  chmod 400 $TMPFLDR/ca-key.pem

  openssl req -new -x509 -config $TMPFLDR/ca.cnf -key $TMPFLDR/ca-key.pem -out $TMPFLDR/ca.pem -days 3650 -batch
# The rm -rf (NOT to use $TMPFLDR to prevent any script change where TMPFLDR is not set correctly.
  cd /tmp/certs.$$;tar cf myca.tar ca*.pem
  cp $TMPFLDR/ca*.pem ~/data/3310
  cp $TMPFLDR/*.tar ~/data/
  
  rm -rf /tmp/certs.$$

else
  # copy CA cert from $HOST1 (/home/mysql/data/3310)
  cd ~/data/3310;scp opc@$HOST1:/home/mysql/data/myca.tar /dev/stdout|tar -xvf -
fi


  


