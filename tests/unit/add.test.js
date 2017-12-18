const chai = require('chai');
const add = require('../../src/helpers/add');

const { expect } = chai;

describe('add()', () => {
  it('should return the sum of two numbers', async () => {
    expect(add(1, 1)).to.equal(2);
    expect(add(2, 8)).to.equal(10);
  });
});
