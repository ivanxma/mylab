 curl -s -u myuser:myuser http://localhost:8080/api/20190715/metadata|jq
echo "Press <ENTER> to continue";read
 curl -s -u myuser:myuser http://localhost:8080/api/20190715/metadata/mycluster/config|jq
echo "Press <ENTER> to continue";read
 curl -s -u myuser:myuser http://localhost:8080/api/20190715/metadata/mycluster/status|jq
echo "Press <ENTER> to continue";read
