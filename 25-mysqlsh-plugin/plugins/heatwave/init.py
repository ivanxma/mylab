from mysqlsh.plugin_manager import plugin, plugin_function
@plugin
class heatwave_utils:
    """
    Heatwavse Utils 

    A collection of utils to manage heatwavse
    """



def __returnTables(session, schema):
   
    # Define the query to get the routines
#    stmt = "select concat(t.table_schema, '.', t.table_name) from information_schema.tables t where t.table_type = 'BASE TABLE' "
    stmt = "select t.schema_name, t.table_name from performance_schema.rpd_tables a , performance_schema.rpd_table_id t where a.id = t.id "
    if schema is not None:
       stmt  = stmt + " AND t.schema_name='%s'" % schema


    stmt = stmt + ";"
    # Execute the query and check for warnings
    result = session.run_sql(stmt)
    tables = result.fetch_all()
    if (result.get_warnings_count() > 0):
        # Bail out and print the warnings
        print("Warnings occurred - bailing out:")
        print(result.get_warnings())
        return False
    tablearray = []
    for row in tables:
        tablearray.append( row[1] )

    return tablearray;


@plugin_function("heatwave_utils.list_tables")
def list_tables(schema=None, session=None):
    """
    Wizard to unload secondary_engine for tables in schema

    Args:
        schema (string): The session to be used on the operation.
        session (object): The optional session object

    """
    # Get hold of the global shell object
    import mysqlsh
    shell = mysqlsh.globals.shell

    if session is None:
        session = shell.get_session()
        if session is None:
            print("No session specified. Either pass a session object to this "
                  "function or connect the shell to a database")
            return

    if schema is None:
        print("No schema specified.")
        return
	
    db = session.get_schema(schema)

    tables = __returnTables(session, schema)

    return tables;


@plugin_function("heatwave_utils.unload_schema")
def unload_schema(schema=None, session=None):
    """
    Wizard to unload secondary_engine for tables in schema

    Args:
        schema (string): The session to be used on the operation.
        session (object): The optional session object

    """

    # Get hold of the global shell object
    import mysqlsh
    shell = mysqlsh.globals.shell

    if session is None:
        session = shell.get_session()
        if session is None:
            print("No session specified. Either pass a session object to this "
                  "function or connect the shell to a database")
            return

    if schema is None:
        print("No schema specified.")
        return
	
    db = session.get_schema(schema)
    session.set_current_schema(schema)
    table = __returnTables(session, schema)
    for i in table:
        print('alter table ' + i + ' secondary_unload')
        result = session.run_sql('alter table ' + i + ' secondary_unload')
        shell.dump_rows(result)


    return
