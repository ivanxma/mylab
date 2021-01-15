
function listAllProperties(o) {
	var objectToInspect;     
	var result = [];
	
	for(objectToInspect = o; objectToInspect !== null; 
           objectToInspect = Object.getPrototypeOf(objectToInspect)) {  
        result = result.concat(
            Object.getOwnPropertyNames(objectToInspect)
        );  
    }
	
	return result; 
}
 
// Save FormData - User to MySQL
exports.save = (req, res) => {
  ( async function() {
  try {
  db = await require('../config/db.js')('demo');
  var user = await db.getTable('user');
  console.log('save...' + listAllProperties(db));
  console.log('save - ' + db.getName());
  console.log('save - ' + db.getName());
  console.log("Post Customers");
  console.log('Post a Customer: ' + JSON.stringify(req.body));
  console.log('req.body.firstname' + req.body.firstname);
  console.log('req.body.lastname' + req.body.lastname);
    console.log(user);
    user.insert('firstname', 'lastname').values(req.body.firstname,  req.body.lastname).execute();
  db.getSession().close();
  } catch (err) {
    console.log("insert failure " + err);
  }
  })();
};
 
// Fetch all Users
exports.findAll = (req, res) => {
  
  var user, rs, query;
  ( async function() {
  try {
    db = await require('../config/db.js')('demo');
    console.log('get  - ' + db.getName());
    console.log("Get All Customers");
    user = db.getTable('user');
    query = await user.select('f1', 'firstname', 'lastname').execute();
    rs = query.fetchAll();   
    console.log(rs);
    db.getSession().close();
    res.send(rs);

  } catch (err) {
    throw err;
  }
  })();
};
