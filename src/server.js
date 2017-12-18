const restify = require('restify');
const getUsers = require('./handlers/getUsers');

const PORT = 8080;

const server = restify.createServer();

server.get('/', getUsers);

server.listen(PORT, () => {
  console.log('%s listening at %s', server.name, server.url); // eslint-disable-line no-console
});

module.exports = server;
