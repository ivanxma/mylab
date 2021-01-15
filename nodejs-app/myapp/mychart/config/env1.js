const env = {
  database: 'demo',
  user: 'demo',
  password: 'demo',
  host: 'localhost',
  port: 33100,
  uri : ''
};

env.uri = env.user + ':' + env.password  + '@' + env.host + ':' + env.port

module.exports = env;
