'use strict';

var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {

(async function() {
 try {
     var hostname=[];
     var x=[];
     var y=[];
     var x2=[];
     var y2=[];
     var x3=[];
     var y3=[];
     var x4=[];
     var y4=[];
     try {
        var schema = await require('../config/db1.js')('demo');
	const myres = await schema.getSession().sql('select @@hostname + @@port as hostname, hour(mytime)*60 + minute(mytime) as mmm, count(*) from demo.mytable a group by hostname, mmm order by mmm desc limit 10;').execute();
	const myrows = await myres.fetchAll();
	for(var i=0;i<myrows.length;i++) {
		x[myrows.length-i-1]=myrows[i][1] - myrows[myrows.length-1][1];
		y[myrows.length-i-1]=myrows[i][2];
                hostname[0]=myrows[i][0];
	}
       await schema.getSession().close();
     } catch (err) {
	console.log("DB1 has error : " + err);
     }
          
	
     try {
        schema = await require('../config/db2.js')('demo');
	const myres2 = await schema.getSession().sql('select @@hostname + @@port as hostname, hour(mytime)*60 + minute(mytime) as mmm, count(*) from demo.mytable a group by hostname, mmm order by mmm desc limit 10;').execute();
	const myrows2 = await myres2.fetchAll();


	for(var i=0;i<myrows2.length;i++) {
		x2[myrows2.length-i-1]=myrows2[i][1] - myrows2[myrows2.length-1][1];
		y2[myrows2.length-i-1]=myrows2[i][2];
		hostname[1]=myrows2[i][0];
	}
       await schema.getSession().close();
     } catch (err) {
	console.log("DB2 has error : " + err);
     }
	

     try {
        schema = await require('../config/db3.js')('demo');
	const myres3 = await schema.getSession().sql('select @@hostname + @@port as hostname, hour(mytime)*60 + minute(mytime) as mmm, count(*) from demo.mytable a group by hostname, mmm order by mmm desc limit 10;').execute();
	const myrows3 = await myres3.fetchAll();


	for(var i=0;i<myrows3.length;i++) {
		x3[myrows3.length-i-1]=myrows3[i][1] - myrows3[myrows3.length-1][1];
		y3[myrows3.length-i-1]=myrows3[i][2];
		hostname[2]=myrows3[3][0];
	}
       await schema.getSession().close();
     } catch (err) {
       console.log("DB3 has error : " + err);
       if (schema != null)
         await schema.getSession().close();
     }

     try {
        schema = await require('../config/db4.js')('demo');
	const myres4 = await schema.getSession().sql('select @@hostname + @@port as hostname, hour(mytime)*60 + minute(mytime) as mmm, count(*) from demo.mytable a group by hostname, mmm order by mmm desc limit 10;').execute();
	const myrows4 = await myres4.fetchAll();

	for(var i=0;i<myrows4.length;i++) {
		x4[myrows4.length-i-1]=myrows4[i][1] - myrows4[myrows4.length-1][1];
		y4[myrows4.length-i-1]=myrows4[i][2];
		hostname[3]=myrows4[i][0];
	}
       await schema.getSession().close();
     } catch (err) {
	console.log("DB4 has error : " + err);
     }
     res.render('mygraph', { x: x, y: y, x2: x2, y2: y2, x3: x3, y3: y3, x4: x4, y4: y4, hostname: hostname })
 } catch (err) {

	res.send("Error" + err)
 }
})() ;



});

module.exports = router;
