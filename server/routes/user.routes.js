const express = require('express');
// const checkAuth = require('../middleware/auth.middleware');
const userControllers = require('../controllers/user.controller');
const cors = require('cors');
const router = express.Router();

router.post('/register', cors(), userControllers.register);
router.post('/login', cors(), userControllers.login);
router.get('/me', cors(), userControllers.getMe);
router.put('/user/update', cors(), userControllers.updateUser);
router.delete('/user/delete', cors(), userControllers.deleteUser);

module.exports = router
