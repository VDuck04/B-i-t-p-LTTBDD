// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAM9SWZnYfHIN03DVjxn23w46JpK9FDnwI',
    appId: '1:523166975315:web:d58a7872da45efb4588da6',
    messagingSenderId: '523166975315',
    projectId: 'smarttask-24101',
    authDomain: 'smarttask-24101.firebaseapp.com',
    storageBucket: 'smarttask-24101.firebasestorage.app',
    measurementId: 'G-EB6FW330YB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNOftO44lIH7WuVhsWhQxJSUB5tOOLF48',
    appId: '1:523166975315:android:9f102d2383fc3570588da6',
    messagingSenderId: '523166975315',
    projectId: 'smarttask-24101',
    storageBucket: 'smarttask-24101.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1I981pp7qNZXRegnbP67vofgo8D54UFc',
    appId: '1:523166975315:ios:1d877cc233f394ab588da6',
    messagingSenderId: '523166975315',
    projectId: 'smarttask-24101',
    storageBucket: 'smarttask-24101.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1I981pp7qNZXRegnbP67vofgo8D54UFc',
    appId: '1:523166975315:ios:1d877cc233f394ab588da6',
    messagingSenderId: '523166975315',
    projectId: 'smarttask-24101',
    storageBucket: 'smarttask-24101.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAM9SWZnYfHIN03DVjxn23w46JpK9FDnwI',
    appId: '1:523166975315:web:d1d097169b833963588da6',
    messagingSenderId: '523166975315',
    projectId: 'smarttask-24101',
    authDomain: 'smarttask-24101.firebaseapp.com',
    storageBucket: 'smarttask-24101.firebasestorage.app',
    measurementId: 'G-EQJYWM2TWX',
  );
}
