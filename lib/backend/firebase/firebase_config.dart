import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBu6lN6YaDoYxByB13srhSOk0EJbOnP8n8",
            authDomain: "sales-flow-pejitb.firebaseapp.com",
            projectId: "sales-flow-pejitb",
            storageBucket: "sales-flow-pejitb.appspot.com",
            messagingSenderId: "437124379650",
            appId: "1:437124379650:web:641fcee74714492da7a31b"));
  } else {
    await Firebase.initializeApp();
  }
}
