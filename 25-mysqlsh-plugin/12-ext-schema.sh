
. ./comm.sh

mysqlsh -e "\? ext"

mysqlsh -e "ext.schema.showProcedure()"
