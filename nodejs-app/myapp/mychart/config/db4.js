'use strict';
const mysqlx = require('@mysql/xdevapi');
const env = require('../config/env4.js');

module.exports = (  (mydb) => {

   var session;
   var db ;
   return (async function() {
   console.log(env.uri + 'database : ' + mydb);
  
   try {
         session = await mysqlx.getSession(env.uri);
         db = await session.getSchema(mydb);
         console.log("getting database  " + db.getName());
	 return db;

   } catch (err) {
  	console.log(err);
        throw err;
   }
   console.log('returning db' + db.getName());
   return db;
   })();
 }
)


