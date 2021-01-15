module.exports = function(app) {
 
  const demo = require('../controllers/demo.controller.js');
  
 
    // Save a User to MySQL
    app.post('/api/demo/save', demo.save);
    // Retrieve all Users
    app.get('/api/demo/all', demo.findAll);
  
  app.get('/demo', (req,res) => {
    res.render('demo', {});
  });
 
}
