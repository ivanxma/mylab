def dbsize(session):
        stmt = "SELECT table_schema AS 'Database', ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size (MB)', count(table_name) as '# of tables' FROM information_schema.TABLES GROUP BY table_schema"

        result = session.run_sql(stmt)
        report = [ result.get_column_names()]
        for row in result.fetch_all():
                report.append(list(row))
        return{ 'report': report}

shell.register_report(
        'dbsize',
        'list',
        dbsize,
        {
                'brief': 'Shows Database Size.',
                'details' : [ 'You need the SELECT privileges on information_schema.TABLES.*'],
                'argc': '0'
        }
)

