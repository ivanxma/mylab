const env = {
  database: 'demo',
  user: 'demo',
  password: 'demo',
  host: 'localhost',
  port: 64460,
  uri : ''
};

env.uri = env.user + ':' + env.password  + '@' + env.host + ':' + env.port

module.exports = env;
