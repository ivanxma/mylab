. ./comm.sh
ndb_mgm -c localhost:1186 -e "1 restart;"
ndb_mgm -c localhost:1186 -e "show;"

