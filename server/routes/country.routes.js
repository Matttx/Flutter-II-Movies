const express = require('express');
// const checkAuth = require('../middleware/auth.middleware');
const countryControllers = require('../controllers/country.controller');
const cors = require('cors');
const router = express.Router();

router.get('/countries', cors(), countryControllers.getCountries);
router.get('/country', cors(), countryControllers.getCountry);

module.exports = router
