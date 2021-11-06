const fetch = require("node-fetch");

exports.makeGetRequest = async function (res, url, method, headers) {
  fetch(url, {
    method: method,
    headers: headers
  })
    .then(response => {
      return response.text();
    })
    .then(text => {
      res.send(text);
    })
    .catch(err => {
      console.log(err);
      res.sendStatus(404).send(err)});
}

exports.makePostRequest = async function (res, url, method, headers, body) {
  fetch(url, {
    method: method,
    headers: headers,
    body: JSON.stringify(body)
  })
    .then(response => {
      return response.text();
    })
    .then(text => {
      res.send(text);
    })
    .catch(err => {
      console.log(err);
      res.sendStatus(404).send(err)});
}
