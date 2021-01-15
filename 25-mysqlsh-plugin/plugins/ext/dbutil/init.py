# Define a show_dbsize function that generates a MySQL Shell report

def show_nopkey(session, args, options):
  query = " SELECT t.table_schema, t.table_name FROM information_schema.tables t     LEFT JOIN (SELECT table_schema, table_name FROM information_schema.statistics GROUP BY table_schema, table_name, index_name HAVING SUM(CASE WHEN non_unique = 0 AND nullable != 'YES' THEN 1 ELSE 0 END) = COUNT(*)) puks ON t.table_schema = puks.table_schema AND t.table_name = puks.table_name WHERE puks.table_name IS NULL AND t.table_type = 'BASE TABLE' AND t.table_schema NOT IN ('mysql', 'sys', 'performance_schema', 'information_schema')" 

  if (options.has_key('limit')):
    query += ' limit ' + str(options['limit'])

  result = session.run_sql(query);

  
  report = []
  if (result.has_data()):
    report = [result.get_column_names()]
    for row in result.fetch_all():
        report.append(list(row))

  return {"report": report}

def show_dbsize(session, args, options):
  query = "SELECT table_schema AS 'Database', ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size (MB)', count(table_name) as '# of tables' FROM information_schema.TABLES GROUP BY table_schema"

  if (options.has_key('limit')):
    query += ' limit ' + str(options['limit'])

  result = session.run_sql(query);

  
  report = []
  if (result.has_data()):
    report = [result.get_column_names()]
    for row in result.fetch_all():
        report.append(list(row))

  return {"report": report}




# Register the show_dbsize function as a MySQL Shell report
shell.register_report("dbsize", "list", show_dbsize, 
	{ 
	"brief":"To list the tables without Primary Key.", 
        'details': ['You need the SELECT privilege on INFORMATION_SCHEMA.TABLES and INFORMATION_SCHEMA.STATISTICS.'],
        'options': [
            {
                'name': 'limit',
                'brief': 'The maximum number of rows to return.',
                'shortcut': 'l',
                'type': 'integer'
            }
        ],
        'argc': '0'
    }
)

# Register the show_nopkey function as a MySQL Shell report
shell.register_report("nopkey", "list", show_nopkey, 
	{ 
	"brief":"To show tables with primary key.", 
        'details': ['You need the SELECT privilege on INFORMATION_SCHEMA.TABLES.'],
        'options': [
            {
                'name': 'limit',
                'brief': 'The maximum number of rows to return.',
                'shortcut': 'l',
                'type': 'integer'
            }
        ],
        'argc': '0'
    }
)



