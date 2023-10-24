import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        break;
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
        break;
      case TargetPlatform.windows:
        break;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyBnMkIiziYTEqM6a5qaoRZXZScTGo30958",
      authDomain: "e-conmmerce.firebaseapp.com",
      projectId: "e-conmmerce",
      storageBucket: "e-conmmerce.appspot.com",
      messagingSenderId: "1021259785772",
      appId: "1:1021259785772:web:df780fb105b5275aac9389",
      measurementId: "G-NGE5MEG7LL");
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnMkIiziYTEqM6a5qaoRZXZScTGo30958',
    appId: '1:1021259785772:android:d63fc996266bc720ac9389',
    messagingSenderId: '1021259785772',
    projectId: 'e-conmmerce',
  );
}
