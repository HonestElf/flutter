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
    apiKey: 'AIzaSyDUfSXl-IMKpjEm1Qd1NejTKboIfOziUHY',
    appId: '1:553939519743:web:32263a519c4dfb60d764ca',
    messagingSenderId: '553939519743',
    projectId: 'flutter-firebase-41d95',
    authDomain: 'flutter-firebase-41d95.firebaseapp.com',
    storageBucket: 'flutter-firebase-41d95.appspot.com',
    measurementId: 'G-TVY81E2P7W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAeOZu0lJZcg_z0RpPn_jnGUXBA2jm9Ps',
    appId: '1:553939519743:android:fe47aae3b640a6a3d764ca',
    messagingSenderId: '553939519743',
    projectId: 'flutter-firebase-41d95',
    storageBucket: 'flutter-firebase-41d95.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUfSXl-IMKpjEm1Qd1NejTKboIfOziUHY',
    appId: '1:553939519743:web:804e1c734d30382dd764ca',
    messagingSenderId: '553939519743',
    projectId: 'flutter-firebase-41d95',
    authDomain: 'flutter-firebase-41d95.firebaseapp.com',
    storageBucket: 'flutter-firebase-41d95.appspot.com',
    measurementId: 'G-2W3RXD6HDT',
  );
}