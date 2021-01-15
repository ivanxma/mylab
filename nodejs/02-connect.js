'use strict';
const mysqlx = require('@mysql/xdevapi');
(async function() {
  try {
    const session = await mysqlx.getSession( {user:'root', password:'welcome1', host:'127.0.0.1', port:33100});
    console.log(session.inspect());
    process.exit();
  } catch (err) {
    console.log(err.message);
    process.exit(1);
  }
})();
