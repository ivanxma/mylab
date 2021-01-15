def uptime(session):
        stmt = "SELECT TIME_FORMAT(SEC_TO_TIME(VARIABLE_VALUE), '%Hh %im %ss') AS Uptime FROM performance_schema.global_status where VARIABLE_NAME='Uptime';"
        result = session.run_sql(stmt)
        report = [ result.get_column_names()]
        for row in result.fetch_all():
                report.append(list(row))
        return{ 'report': report}

shell.register_report(
        'uptime',
        'list',
        uptime,
        {
                'brief': 'Shows Server Uptime.',
                'details' : [ 'You need the SELECT privileges on performance_schema.*'],
                'argc': '0'
        }
)

