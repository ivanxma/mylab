export TMPFLDR=/tmp/mycert.$$

mkdir -p $TMPFLDR

cat <<EOF > $TMPFLDR/myopenssl.cnf

[ req ]
prompt = no
distinguished_name = req_dn

[ req_dn ]
CN = $HOSTNAME
EOF


openssl req -newkey rsa:2048 -days 3600         -nodes -keyout ~/data/3310/server-key.pem -out $TMPFLDR/server-req.pem -config $TMPFLDR/myopenssl.cnf 
openssl x509 -req -in $TMPFLDR/server-req.pem -days 3600         -CA ~/data/3310/ca.pem -CAkey ~/data/3310/ca-key.pem -set_serial 01 -out ~/data/3310/server-cert.pem

openssl req -newkey rsa:2048 -days 3600         -nodes -keyout ~/data/3310/client-key.pem -out $TMPFLDR/client-req.pem -config $TMPFLDR/myopenssl.cnf 
openssl x509 -req -in $TMPFLDR/client-req.pem -days 3600         -CA ~/data/3310/ca.pem -CAkey ~/data/3310/ca-key.pem -set_serial 01 -out ~/data/3310/client-cert.pem

# rm the tmp folder but not to use $TMPFLDR to prevent any empty variable
rm -rf /tmp/mycert.$$


# verify the cert
openssl verify -CAfile ~/data/3310/ca.pem ~/data/3310/ca.pem ~/data/3310/server-cert.pem ~/data/3310/client-cert.pem
