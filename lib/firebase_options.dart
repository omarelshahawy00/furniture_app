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
    apiKey: 'AIzaSyA1E7U7Bveu-ODlMtY_crlzO-YyfNS34ow',
    appId: '1:1073858834450:web:8e72191eb774677605e8cb',
    messagingSenderId: '1073858834450',
    projectId: 'furniture-app-6bf16',
    authDomain: 'furniture-app-6bf16.firebaseapp.com',
    storageBucket: 'furniture-app-6bf16.firebasestorage.app',
    measurementId: 'G-3X24Z5EC12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIMNryXaGL9mn0dl8yuLX4wWJzV3MFarA',
    appId: '1:1073858834450:android:935c512fd9e9cf7e05e8cb',
    messagingSenderId: '1073858834450',
    projectId: 'furniture-app-6bf16',
    storageBucket: 'furniture-app-6bf16.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDe1IcJ-lSTHgDgOdmuIZK5HTbh_ILkssQ',
    appId: '1:1073858834450:ios:f7b949e25fe4c0d005e8cb',
    messagingSenderId: '1073858834450',
    projectId: 'furniture-app-6bf16',
    storageBucket: 'furniture-app-6bf16.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDe1IcJ-lSTHgDgOdmuIZK5HTbh_ILkssQ',
    appId: '1:1073858834450:ios:f7b949e25fe4c0d005e8cb',
    messagingSenderId: '1073858834450',
    projectId: 'furniture-app-6bf16',
    storageBucket: 'furniture-app-6bf16.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1E7U7Bveu-ODlMtY_crlzO-YyfNS34ow',
    appId: '1:1073858834450:web:1ddd92e4db4f4ba105e8cb',
    messagingSenderId: '1073858834450',
    projectId: 'furniture-app-6bf16',
    authDomain: 'furniture-app-6bf16.firebaseapp.com',
    storageBucket: 'furniture-app-6bf16.firebasestorage.app',
    measurementId: 'G-Q85ZTKV6G3',
  );
}
