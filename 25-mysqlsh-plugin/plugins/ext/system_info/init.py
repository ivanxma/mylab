# init.py
# -------
from mysqlsh.plugin_manager import plugin, plugin_function

@plugin
class system_info:
   """
   System Information
   A collection of tools to gather system information.
   """

@plugin_function("system_info.get_public_key")
def get_public_key(session=None, verbose=False):
    if session is None:
        import mysqlsh

        shell = mysqlsh.globals.shell
        session = shell.get_session()
        if session is None:
            print("No session specified. Either pass a session object to this "
                "function or connect the shell to a database")
            return
    if session is not None:
        r = session.run_sql("SELECT VARIABLE_VALUE FROM performance_schema.global_status where variable_name = 'Caching_sha2_password_rsa_public_key'")
        if verbose :
           print("SELECT VARIABLE_VALUE FROM performance_schema.global_status where variable_name = 'Caching_sha2_password_rsa_public_key'")

        shell.dump_rows(r)

@plugin_function("system_info.uptime")
def uptime(session=None):
    if session is None:
        import mysqlsh

        shell = mysqlsh.globals.shell
        session = shell.get_session()
        if session is None:
            print("No session specified. Either pass a session object to this "
                "function or connect the shell to a database")
            return
    if session is not None:
        r = session.run_sql("SELECT TIME_FORMAT(SEC_TO_TIME(VARIABLE_VALUE), '%Hh %im %ss') AS Uptime FROM performance_schema.global_status where VARIABLE_NAME='Uptime';")

        shell.dump_rows(r)

