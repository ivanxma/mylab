. ./comm.sh

mysql --login-path=testroot << EOL

select audit_log_filter_set_filter ('root_enable_logging', '
{
  "filter": {
    "log" : true,
    "class": {
		"name": "table_access" , 
		"event": { 
			"name" : "read" ,
			"log" : { "not" : 
			 { "field": { "name": "table_database.str", "value" : "appdb" } }
			}
		}
	}
  } 
}
');

select audit_log_filter_set_filter ('appuser_enable_logging', '
{
  "filter": {
    "log" : true,
    "class": { 
		"name": "table_access" , 
		"event": 
		  { "name" : [ "read" , "insert", "update", "delete" ],
		    "log" : { 
			"not" : 
			 { "field": { "name": "table_database.str", "value" : "appdb" } }
		    }
		  }
	}
  }
}
');



EOL
