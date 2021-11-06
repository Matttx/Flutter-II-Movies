const express = require("express");
require('dotenv').config();
const port = process.env.SERVER_PORT || 8000;

const cors = require('cors');
const morgan = require('morgan');
const bodyParser = require("body-parser");
const app = express();

const router = require('./routes/router');
const userRouter = require('./routes/user.routes');

app.use(morgan('combined'));
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

app.use(router);
app.use(userRouter);

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
