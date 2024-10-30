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
    apiKey: 'AIzaSyBi4uSCbxTfLTulB_lz4BDbGEraRvjfA_M',
    appId: '1:516418021525:web:a2485e66840805dc4d539c',
    messagingSenderId: '516418021525',
    projectId: 'fruit-hub-ddfb0',
    authDomain: 'fruit-hub-ddfb0.firebaseapp.com',
    storageBucket: 'fruit-hub-ddfb0.appspot.com',
    measurementId: 'G-19P4MXHJND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCABxqRojd_hEgkSkZRn8x965sm2Ual21I',
    appId: '1:516418021525:android:a89497ba4569c40d4d539c',
    messagingSenderId: '516418021525',
    projectId: 'fruit-hub-ddfb0',
    storageBucket: 'fruit-hub-ddfb0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW0Rht4m3oimUxQQY66HgfEZVQVLSKd3Y',
    appId: '1:516418021525:ios:69626580bd52cd934d539c',
    messagingSenderId: '516418021525',
    projectId: 'fruit-hub-ddfb0',
    storageBucket: 'fruit-hub-ddfb0.appspot.com',
    iosBundleId: 'com.example.fruitsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBW0Rht4m3oimUxQQY66HgfEZVQVLSKd3Y',
    appId: '1:516418021525:ios:69626580bd52cd934d539c',
    messagingSenderId: '516418021525',
    projectId: 'fruit-hub-ddfb0',
    storageBucket: 'fruit-hub-ddfb0.appspot.com',
    iosBundleId: 'com.example.fruitsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBi4uSCbxTfLTulB_lz4BDbGEraRvjfA_M',
    appId: '1:516418021525:web:ccff1f49d96f52754d539c',
    messagingSenderId: '516418021525',
    projectId: 'fruit-hub-ddfb0',
    authDomain: 'fruit-hub-ddfb0.firebaseapp.com',
    storageBucket: 'fruit-hub-ddfb0.appspot.com',
    measurementId: 'G-NMCY1EHEYD',
  );
}