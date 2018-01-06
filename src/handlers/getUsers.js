module.exports = (req, res, next) => {
  res.send([{
    name: 'Joe Schmo',
  }]);

  next();
};
