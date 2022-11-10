openssl genrsa 2048 > template/ca-key.pem
openssl req -new -x509 -nodes -days 3600 \
        -key template/ca-key.pem -out template/ca.pem
