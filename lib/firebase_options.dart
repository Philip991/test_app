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
    apiKey: 'AIzaSyDDAgEe9M_jkzoc8qRVaobDROuRSq_nk84',
    appId: '1:822353499363:web:21cf0399b0f67bc9b921d6',
    messagingSenderId: '822353499363',
    projectId: 'assess-test-db349',
    authDomain: 'assess-test-db349.firebaseapp.com',
    storageBucket: 'assess-test-db349.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIE_3X8CLg945u3ivKZVExNwDiAqAxtNk',
    appId: '1:822353499363:android:cfe0dabd23b934cbb921d6',
    messagingSenderId: '822353499363',
    projectId: 'assess-test-db349',
    storageBucket: 'assess-test-db349.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIDGukZgpHRQAFWE1ZtsmV7gM4sQhI1IM',
    appId: '1:822353499363:ios:4994b31aa423710db921d6',
    messagingSenderId: '822353499363',
    projectId: 'assess-test-db349',
    storageBucket: 'assess-test-db349.appspot.com',
    iosClientId: '822353499363-tf4jimnmthrgrs8uag8nh1gfi7gn4g8e.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIDGukZgpHRQAFWE1ZtsmV7gM4sQhI1IM',
    appId: '1:822353499363:ios:4994b31aa423710db921d6',
    messagingSenderId: '822353499363',
    projectId: 'assess-test-db349',
    storageBucket: 'assess-test-db349.appspot.com',
    iosClientId: '822353499363-tf4jimnmthrgrs8uag8nh1gfi7gn4g8e.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp',
  );
}
