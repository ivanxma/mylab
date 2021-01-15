
'use strict';
const mysqlx = require('@mysql/xdevapi');

(async function() {
  try {
	const session = await mysqlx.getSession({
	  user: 'root',
	  password: 'welcome1',
	  host: '127.0.0.1',
	  port: 33100
	});

	const schema = await session.createSchema('products');
	console.log("Schema Created : " + schema.getName()); // { name: 'products' }

	const collection = await schema.createCollection('servers', { ReuseExistingObject:true});
	console.log("Collection created : " + collection.getName());

	const collections = await schema.getCollections();
	console.log(collections);

	session.dropSchema('products');
	session.close();
	process.exit();
		

  } catch (err) {
	console.log(err.message);
	process.exit(1);
  }

})();
