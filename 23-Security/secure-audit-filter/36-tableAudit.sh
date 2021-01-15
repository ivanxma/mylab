. ./comm.sh

mysql --login-path=testroot << EOL

select audit_log_filter_set_filter ('log_table_mysql_db', '
{
  "filter": {
    "class": { 
		"name": "table_access" , 
		"event": { 
			"name" : "insert", 
			"log" : { 
				"field" : { 
					"name" : "table_name.str", 
					"value" : "audittable1" 
				}
			}
		}
	}
  } 
}
');

select audit_log_filter_set_filter ('log_table_mysql_dbx', '
{ "filter": { "class": { "name": "table_access",
                         "event": { "name": "read",
                                    "log": { "field": { "name": "table_name.str",
                                                        "value": "user" } } } } } }
');

EOL
