import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDRF2q3TZidH7JKX8MwF6tNSxjoS3l1PAs",
            authDomain: "projeto-kr3y5v.firebaseapp.com",
            projectId: "projeto-kr3y5v",
            storageBucket: "projeto-kr3y5v.firebasestorage.app",
            messagingSenderId: "923627686881",
            appId: "1:923627686881:web:a895bad791c7d6ee4060a0"));
  } else {
    await Firebase.initializeApp();
  }
}
