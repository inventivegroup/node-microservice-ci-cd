const chai = require('chai');
const chaiHttp = require('chai-http');

const { expect } = chai;

chai.use(chaiHttp);

const BASE = 'http://api:8080';

describe('GET /', () => {
  it('should return array of users', async () => {
    const response = await chai.request(BASE).get('/');

    expect(response.body).to.be.an('array');
    expect(response.status).to.equal(200);
  });
});

