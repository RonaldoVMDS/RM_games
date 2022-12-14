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
    apiKey: 'AIzaSyAYyPw42tGH1fAh7cLJym7rbgovNBRezEU',
    appId: '1:457432734332:web:45f613c087d5daa21987f9',
    messagingSenderId: '457432734332',
    projectId: 'ecommerce-rm-games',
    authDomain: 'ecommerce-rm-games.firebaseapp.com',
    storageBucket: 'ecommerce-rm-games.appspot.com',
    measurementId: 'G-PDJGH5ZD6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC72c-5Uac3v3cRg5-u8_aaoKaFZTJoLkk',
    appId: '1:457432734332:android:a8929f0ce367dae41987f9',
    messagingSenderId: '457432734332',
    projectId: 'ecommerce-rm-games',
    storageBucket: 'ecommerce-rm-games.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmxzPRPMZZEsxkmyGpj75hJqizAd-Exec',
    appId: '1:457432734332:ios:31c832fa779c01a41987f9',
    messagingSenderId: '457432734332',
    projectId: 'ecommerce-rm-games',
    storageBucket: 'ecommerce-rm-games.appspot.com',
    androidClientId: '457432734332-o5i523vo2824sqa811ehtn7d6ul0j7ao.apps.googleusercontent.com',
    iosClientId: '457432734332-jbc699isd6aa8pdk184vr38bi6i4fm0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.rmGames',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmxzPRPMZZEsxkmyGpj75hJqizAd-Exec',
    appId: '1:457432734332:ios:31c832fa779c01a41987f9',
    messagingSenderId: '457432734332',
    projectId: 'ecommerce-rm-games',
    storageBucket: 'ecommerce-rm-games.appspot.com',
    androidClientId: '457432734332-o5i523vo2824sqa811ehtn7d6ul0j7ao.apps.googleusercontent.com',
    iosClientId: '457432734332-jbc699isd6aa8pdk184vr38bi6i4fm0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.rmGames',
  );
}
