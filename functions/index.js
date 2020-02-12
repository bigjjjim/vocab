const functions = require('firebase-functions');

const data = require("./data.json");
const collectionKey = "words"; 
const { Storage } = require('@google-cloud/storage');
const uuidv1 = require('uuid/v1');
const admin = require('firebase-admin');

// const spawn = require('child-process-promise').spawn;
const path = require('path');
const os = require('os');
const fs = require('fs');

const serviceAccount = require("./serviceAccountKey.json");


//name of the collection
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://vocab-3fdd5.firebaseio.com"
});

const db = admin.firestore();

const storage = new Storage();


exports.createUserDoc = functions.auth.user().onCreate((user) => {
  const userUid = user.uid;
  const userScheme = {
     email: user.email,
     displayName: user.displayName,
     uid: userUid,
   //   favorite: [],
   //   uploaded: [],
     dateCreation: new Date(),
     words: data
   }

  //  const wordList = {
     

  //    useruid: userUid,
  //   words: data
  //  }
   db.collection('users').doc(user.uid).set(userScheme);
  //  db.collection('users').doc(user.uid).collection('wordLists').doc('words').set(wordList);
 



});




// const settings = {timestampsInSnapshots: true};
// firestore.settings(settings);
// if (data && (typeof data === "object")) {
// Object.keys(data).forEach(docKey => {
//  firestore.collection(collectionKey).doc(docKey).set(data[docKey]).then((res) => {
//     console.log("Document " + docKey + " successfully written!");
// }).catch((error) => {
//    console.error("Error writing document: ", error);
// });
// });
// }

