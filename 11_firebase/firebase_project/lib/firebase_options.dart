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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDvuP4hyzfMLD2QqQ7MBQ_aj29WRY5QxxA',
    appId: '1:47067439451:web:55e1b781e0948500ed3a7e',
    messagingSenderId: '47067439451',
    projectId: 'fir-homework-fc258',
    authDomain: 'fir-homework-fc258.firebaseapp.com',
    storageBucket: 'fir-homework-fc258.appspot.com',
    measurementId: 'G-DZS7J8XEWN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8ivQxqphnxDGe7DzZFYu4WlprPUObLKk',
    appId: '1:47067439451:android:fb5534c1b323a590ed3a7e',
    messagingSenderId: '47067439451',
    projectId: 'fir-homework-fc258',
    storageBucket: 'fir-homework-fc258.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDvuP4hyzfMLD2QqQ7MBQ_aj29WRY5QxxA',
    appId: '1:47067439451:web:d0c4f25d75021c52ed3a7e',
    messagingSenderId: '47067439451',
    projectId: 'fir-homework-fc258',
    authDomain: 'fir-homework-fc258.firebaseapp.com',
    storageBucket: 'fir-homework-fc258.appspot.com',
    measurementId: 'G-LLLZ6VKY75',
  );
}