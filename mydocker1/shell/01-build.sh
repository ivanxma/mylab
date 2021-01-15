
docker rm mys1
rm -f shell.tar.gz
tar -zcvf shell.tar.gz myinit/

docker image rm myshell
docker build --tag myshell .

