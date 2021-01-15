import io
import json
import logging
import mysql.connector


from fdk import response

from netifaces import interfaces, ifaddresses, AF_INET


def handler(ctx, data: io.BytesIO = None):

    name = "World christmas"
    config = {
      'user': 'myroot',
      'password': 'Welcome1!',
      'host': '10.0.1.28',
      'database': 'db1',
      'raise_on_warnings': True
    }
    myip = 'IP:'


    try:
        cnx = mysql.connector.connect(**config)
        resp = getdata(cnx)
        cnx.close()

        mds_host = ctx.Config().get("MDS_HOST")
        config['user'] = ctx.Config().get("MDS_USER")
        config['password'] = ctx.Config().get("MDS_PASSWORD")
        config['host'] = ctx.Config().get("MDS_HOST")
        config['port'] = ctx.Config().get("MDS_PORT")
        logging.getLogger().info('mds host: ' + mds_host)
       
        body = json.loads(data.getvalue())
        name = body.get("name")
        logging.getLogger().info('body - name : ' + name)
    except (Exception, ValueError) as ex:
        logging.getLogger().info('error parsing json payload: ' + str(ex))

    logging.getLogger().info("Inside Python Hello World function")
    return response.Response(
        ctx, response_data=json.dumps(
            {"message": "Hellox {0}".format(name), "userdata": resp,
             "ctxconfig": dict(ctx.Config()),
             "ctxheader": ctx.Headers() } ),
            # {"instances" : resp}),
        headers={"Content-Type": "application/json"}
    )

def getdata(conn):
   cur = conn.cursor()
   cur.execute('SELECT host,user FROM mysql.user ')
   row_headers=[x[0] for x in cur.description] #this will extract row headers
   rv = cur.fetchall()
   json_data=[]
   for result in rv:
        json_data.append(dict(zip(row_headers,result)))
   return json.dumps(json_data)
