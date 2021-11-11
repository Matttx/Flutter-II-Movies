//const fetch = require("node-fetch");
const { db } = require("../../config/firebase.js");

exports.createDocument = function (collectionName, docDatas, id) {
  const query = db.collection(collectionName).doc(id);

  return query.set(docDatas)
    .then(() => ({code: 200, message: 'Account successfully register'}))
    .catch((err) => ({code: 400, message: err}));
}

// -- Function to get all documents from a collection with a condition
exports.getSpecificDocuments = async function (collectionName, fieldName, operator, value) {
  const docRef = db.collection(collectionName);
  const docSnapshot = await docRef.where(fieldName, operator, value).get();
  const docList = [];

  if (docSnapshot.empty) {
    return ({code: 400, result: [], message: 'Document not found'});
  }
  docSnapshot.forEach((doc) => {
    docList.push(doc.data());
  });
  return ({code: 200, result: docList, message: 'Document/s successfully found/s'});
}

// -- Function to get all documents from a collection
exports.getAllDocuments = async function (collectionName) {
  const docRef = db.collection(collectionName);
  const docSnapshot = await docRef.get();
  const docList = [];

  if (docSnapshot.empty) {
    return ({code: 400, result: [], message: 'Document not found'});
  }
  docSnapshot.forEach((doc) => {
    docList.push(doc.data());
  });
  return ({code: 200, result: docList, message: 'Document/s successfully found/s'});
}

// -- Function to update a field in a doc or create new one if it doesn't exist
exports.updateField = function(collectionName, docID, field) {
  db.collection(collectionName)
    .doc(docID)
    .update(field)
    .catch((error) => {
      console.log("Error in desk update:", error);
      return ({code: 400, result: [], message: 'Update failed'});
    });
  return ({code: 200, result: [], message: 'Document successfully updated'});
}

// -- Function to delete a doc
exports.deleteDocument = async function(collectionName, docId) {
  db.collection(collectionName)
    .doc(docId)
    .delete()
    .catch((err) => {
      return ({code: 400, result: [], message: 'Delete failed'});
    })
  return ({code: 200, result: [], message: 'Document successfully deleted'});
}

