. ./comm.sh
ndb_mgm -c localhost:1186 -e "1 restart -i;"
ndb_mgm -c localhost:1186 -e "show;"

