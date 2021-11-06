//const fetch = require("node-fetch");
const { db } = require("../../config/firebase.js");

exports.createDocument = function (collectionName, docDatas) {
  const query = db.collection(collectionName).doc();

  return query.set(docDatas)
    .then((r) => ({code: 200, message: r}))
    .catch((err) => ({code: 400, message: err}));
}
/*

exports.createDocumentCall = function (req, res) {
  createDocument(req.params.name, req.params.id, req.params.data)
    .then((r) => res.status(200).send(r))
    .catch((err) => res.status(404).send(err));
};


// -- Function to get all documents from a collection
async function getAllDocuments(collectionName) {
  const docRef = db.collection(collectionName);
  const docSnapshot = await docRef.get();
  const docList = [];

  if (docSnapshot.empty) {
    return [];
  }
  docSnapshot.forEach((doc) => {
    docList.push(doc.data());
  });
  return docList;
}

exports.getAllDocumentsCall = async function (req, res) {
  getAllDocuments(req.params.name)
    .then((result) => {
      res.status(200).send(result);
    })
    .catch((err) => {
      res.send(err);
    });
};

// -- Function to update a field in a doc or create new one if it doesn't exist
function updateField(collectionName, docID, field) {
  db.collection(collectionName)
    .doc(docID)
    .update(field)
    .catch((error) => {
      console.log("Error in desk update:", error);
      return 404;
    });
  return 200;
}

exports.updateFieldCall = function (req, res) {
  updateField(req.params.name)
    .then((r) => res.status(200).send(r))
    .catch((err) => res.status(404).send(err));
};
*/
