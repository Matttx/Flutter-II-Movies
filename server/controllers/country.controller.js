const genericController = require('../controllers/helpers/generic.controller');

const getCountries = async  (req, res) => {
    console.log(`GET '/countries' 🤠 ${Date()}`);

    const result = await genericController
        .getAllDocuments('stats');

    res.status(result.code).send({message: result.message, result: result.result});
}

const getCountry = async  (req, res) => {
    console.log(`GET '/country' 🤠 ${Date()}`);

    const result = await genericController
        .getSpecificDocuments("stats", "countryName", "==", req.query.countryName);

    res.status(result.code).send({message: result.message, result: result.result});
}


module.exports = {
    getCountries,
    getCountry
}