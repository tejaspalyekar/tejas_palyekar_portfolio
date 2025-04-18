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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBf9Ucs7VX3IzGmO5ljS-EZpq5d2xprjdM',
    appId: '1:238074124383:web:6dcae3096420f2e4aa23ea',
    messagingSenderId: '238074124383',
    projectId: 'tejas-portfolio-f3f67',
    authDomain: 'tejas-portfolio-f3f67.firebaseapp.com',
    storageBucket: 'tejas-portfolio-f3f67.firebasestorage.app',
    measurementId: 'G-91NRJCXDPC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeFTan9BrhI5NjWAd66YgwILuOBWZGvZE',
    appId: '1:238074124383:android:854e835fb1c27001aa23ea',
    messagingSenderId: '238074124383',
    projectId: 'tejas-portfolio-f3f67',
    storageBucket: 'tejas-portfolio-f3f67.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcwLVuiIultNPKmwAdUDYyN9hnGjyEUFw',
    appId: '1:238074124383:ios:1869aba2ea3a738faa23ea',
    messagingSenderId: '238074124383',
    projectId: 'tejas-portfolio-f3f67',
    storageBucket: 'tejas-portfolio-f3f67.firebasestorage.app',
    iosBundleId: 'com.example.tejasPalyekarPortfolio',
  );
}
