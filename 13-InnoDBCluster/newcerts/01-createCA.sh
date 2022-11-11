openssl genrsa 2048 > template/ca-key.pem
sed  "s/MYHOST/$HOSTNAME/g" template/myopenssl.cnf > myopenssl.cnf
openssl req -new -x509 -nodes -days 3600 -set_serial 01 -key template/ca-key.pem -out template/ca.pem --config myopenssl.cnf
