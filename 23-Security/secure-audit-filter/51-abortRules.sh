. ./comm.sh

mysql --login-path=testroot << EOL

select audit_log_filter_set_filter ('abort_dml_on_bank_account', '
{ 
   "filter": { 
	"class": {
		 "name": "table_access", 
		"event": { 
			"name": [ "insert", "update", "delete" ], 
			"abort": {
				"and" : [
					{ "field":  {"name": "table_database.str", "value":"finance"} },
					{ "field":  {"name": "table_name.str", "value":"bank_account"} }
				]
			}
		} 
	} 
   } 
}
');


EOL
