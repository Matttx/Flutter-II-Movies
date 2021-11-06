const express = require('express');
const checkAuth = require('../middleware/auth.middleware');
const userControllers = require('../controllers/user.controller');
var cors = require('cors');
const router = express.Router();

router.post('/signup', cors(), userControllers.register);
router.post('/login', cors(), userControllers.login);
router.get('/me', cors(), userControllers.getMe);

module.exports = router
