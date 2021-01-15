. ./comm.sh

mysql --login-path=testroot << EOL

select audit_log_filter_set_filter ('log_app_db', '
{
  "filter": {
    "class": [ 
		{	
		"name": "table_access" , 
		"event": { 
			"name" : ["insert", "update", "delete", "read"],
			"log" : { 
				"field" : { 
					"name" : "table_database.str", 
					"value" : "appdb" 
					}
				}
			}
		},
		{ "name": "general", "log": false}
	]
  } 
}
');


EOL
