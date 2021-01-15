
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

// adding new documents
	session.startTransaction();	
	collection.add({ name:'Sakila', version:5.7, revision: 23, public: true}).execute();

	const batchA = collection
		.add({ name:'Sakila', version:8.0, revision: 1, public: true})
		.add({ name:'Sakila', version:8.0, revision: 2, public: true})
		.add({ name:'Sakila', version:8.0, revision: 3, public: true});
	const batchB = collection
		.add( [
		   { name:'Sakila', version:8.0, revision: 11, public: true},
		   { name:'Sakila', version:8.0, revision: 12, public: true} 
		]);


	await Promise.all([ batchA.execute(), batchB.execute()]);
	session.commit();	


	const collections = await schema.getCollections();
	const serverCol = await schema.getCollection("servers");
	const docResult = await serverCol.find('version = :version AND revision >= :revision and public = :public')
	.bind ({ version: 8.0, revision: 11, public: true})
	.fields('_id', 'name', 'revision')
	.sort('revision ASC')
	.limit(2)
	.execute( function(doc) {
		console.log(doc);
	});



	session.dropSchema('products');
	session.close();
	process.exit();
		

  } catch (err) {
	console.log(err.message);
	process.exit(1);
  }

})();
