// const jwt = require("jsonwebtoken");
const genericController = require('../controllers/helpers/generic.controller');
const {db} = require("../config/firebase");

const register = async (req, res, next) => {
  const result = await genericController
      .createDocument('user', 'test');

  res.status(result.code).send(result.message);
}

const login = (req, res, next) => {
  res.json("Route login");
}

const getMe = (req, res, next) => {
  res.json("Route getMe");
}

module.exports = {
  login,
  register,
  getMe,
};
