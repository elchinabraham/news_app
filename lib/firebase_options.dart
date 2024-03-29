// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDjt1w7PCx2S8JD-M7jy9y7V0yUS83E_Cc',
    appId: '1:474271435101:web:efbcdd6b38d09a8efd40b4',
    messagingSenderId: '474271435101',
    projectId: 'news-service-da87e',
    authDomain: 'news-service-da87e.firebaseapp.com',
    databaseURL: 'https://news-service-da87e-default-rtdb.firebaseio.com',
    storageBucket: 'news-service-da87e.appspot.com',
    measurementId: 'G-HYXWFEDBS6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHHH_L6XM8norWYlHCf_rLq11As0MfQps',
    appId: '1:474271435101:android:75b1a92cd629cd75fd40b4',
    messagingSenderId: '474271435101',
    projectId: 'news-service-da87e',
    databaseURL: 'https://news-service-da87e-default-rtdb.firebaseio.com',
    storageBucket: 'news-service-da87e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzXvjJZhy5y3ZpO4PlFwH8_x6sXWo6D7s',
    appId: '1:474271435101:ios:3b36f06cda8a5cd7fd40b4',
    messagingSenderId: '474271435101',
    projectId: 'news-service-da87e',
    databaseURL: 'https://news-service-da87e-default-rtdb.firebaseio.com',
    storageBucket: 'news-service-da87e.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzXvjJZhy5y3ZpO4PlFwH8_x6sXWo6D7s',
    appId: '1:474271435101:ios:b9d9990b6e21740ffd40b4',
    messagingSenderId: '474271435101',
    projectId: 'news-service-da87e',
    databaseURL: 'https://news-service-da87e-default-rtdb.firebaseio.com',
    storageBucket: 'news-service-da87e.appspot.com',
    iosBundleId: 'com.example.newsApp.RunnerTests',
  );
}
