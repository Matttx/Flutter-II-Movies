const admin = require("firebase-admin")
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require('firebase-admin/firestore');
const config = require('./firebase.config.json')
require("firebase/firestore");

const app = initializeApp({credential: admin.credential.cert(config)});
const db = getFirestore();
module.exports = { app, db };
console.log(app.name ? "Firebase Mode Activated" : "Firebase not working :(");
