// const jwt = require("jsonwebtoken");
const { v4: uuidv4 } = require("uuid");
const genericController = require("../controllers/helpers/generic.controller");

const register = async (req, res) => {
  console.log(`POST '/register' 🤠 ${Date()}`);

  const body = { ...req.body, jwt: uuidv4() };

  const verifyAddress = await genericController.getSpecificDocuments(
    "user",
    "email",
    "==",
    body.email
  );

  if (verifyAddress.result.length === 0) {
    const result = await genericController.createDocument(
      "user",
      body,
      body.jwt
    );

    res
      .status(result.code)
      .send({
        message: result.message,
        result: result.code === 200 ? body.jwt : null,
      });
    return;
  }
  res.status(400).send({ message: "Email address already used", result: [] });
};

const login = async (req, res) => {
  console.log(`POST '/login' 🤠 ${Date()}`);

  const result = await genericController.getSpecificDocuments(
    "user",
    "email",
    "==",
    req.body.email
  );

  if (result.result.length === 0) {
    res
      .status(400)
      .send({
        message: "No account exists with this email address",
        result: [],
      });
  }
  if (req.body.password === result.result[0].password) {
    res
      .status(200)
      .send({ message: "Successfully Login", result: result.result[0].jwt });
    return;
  }
  res.status(400).send({ message: "Login failed", result: [] });
};

const getMe = async (req, res) => {
  console.log(`GET '/me' 🤠 ${Date()}`);

  const result = await genericController.getSpecificDocuments(
    "user",
    "jwt",
    "==",
    req.query.jwt
  );

  res
    .status(result.code)
    .send({ message: result.message, result: result.result });
};

const updateUser = async (req, res) => {
  console.log(`PUT '/user/update' 🤠 ${Date()}`);

  console.log(req.body);
  const result = genericController.updateField(
    "user",
    req.query.jwt,
    req.body.fields
  );

  res.status(result.code).send({ message: result.message, result: [] });
};

const deleteUser = async (req, res) => {
  console.log(`DELETE '/user/delete' 🤠 ${Date()}`);

  const result = await genericController.deleteDocument("user", req.query.jwt);

  res.status(result.code).send({ message: result.message, result: [] });
};

module.exports = {
  login,
  register,
  getMe,
  updateUser,
  deleteUser,
};
