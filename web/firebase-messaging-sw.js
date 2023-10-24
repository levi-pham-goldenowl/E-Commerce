importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-auth.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-analytics.js");


firebase.initializeApp({
  apiKey: "AIzaSyBnMkIiziYTEqM6a5qaoRZXZScTGo30958",
  authDomain: "e-conmmerce.firebaseapp.com",
  projectId: "e-conmmerce",
  measurementId: "G-NGE5MEG7LL",
  storageBucket: "e-conmmerce.appspot.com",
  messagingSenderId: "1021259785772",
  appId: "1:1021259785772:web:df780fb105b5275aac9389",
});

// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
}); 