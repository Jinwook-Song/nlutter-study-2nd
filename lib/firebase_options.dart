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
    apiKey: 'AIzaSyB8bUS29tjYTnJ7ScjmQq7p80kC70nMv3c',
    appId: '1:485004072009:web:b3be6f29058da1f4bb5b98',
    messagingSenderId: '485004072009',
    projectId: 'flutter-nomad-study-v2',
    authDomain: 'flutter-nomad-study-v2.firebaseapp.com',
    storageBucket: 'flutter-nomad-study-v2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzVJEYS4oc4gGCSZvsXKf4FuNZ1hCHynw',
    appId: '1:485004072009:android:001af6a02ff1c2d8bb5b98',
    messagingSenderId: '485004072009',
    projectId: 'flutter-nomad-study-v2',
    storageBucket: 'flutter-nomad-study-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChb7ySZoLn7R4zPFEENwCRBJ8Ahs5I78o',
    appId: '1:485004072009:ios:5356329996c845d7bb5b98',
    messagingSenderId: '485004072009',
    projectId: 'flutter-nomad-study-v2',
    storageBucket: 'flutter-nomad-study-v2.appspot.com',
    iosBundleId: 'com.example.flutterNomadStudyV2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChb7ySZoLn7R4zPFEENwCRBJ8Ahs5I78o',
    appId: '1:485004072009:ios:63cbd7e8caa932bfbb5b98',
    messagingSenderId: '485004072009',
    projectId: 'flutter-nomad-study-v2',
    storageBucket: 'flutter-nomad-study-v2.appspot.com',
    iosBundleId: 'com.example.flutterNomadStudyV2.RunnerTests',
  );
}
