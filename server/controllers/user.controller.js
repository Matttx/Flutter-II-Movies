const jwt = require("jsonwebtoken");

const register = (req, res, next) => {
  res.json("Route register");
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
