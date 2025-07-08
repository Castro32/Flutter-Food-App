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
        return web;
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
    apiKey: 'AIzaSyCNNEAyPCsXjtv3_EWebre_i0HLF0z8nx4',
    appId: '1:68423795465:web:YOUR_WEB_APP_ID',
    messagingSenderId: '68423795465',
    projectId: 'cas-delivery',
    authDomain: 'cas-delivery.firebaseapp.com',
    storageBucket: 'cas-delivery.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNNEAyPCsXjtv3_EWebre_i0HLF0z8nx4',
    appId: '1:68423795465:android:cfa286a849290561c149d8',
    messagingSenderId: '68423795465',
    projectId: 'cas-delivery',
    storageBucket: 'cas-delivery.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC54P0QfeM4JMUcZzIlVRwvbbHGir7aV6E',
    appId: '1:68423795465:ios:eae9872c8e6f499ac149d8',
    messagingSenderId: '68423795465',
    projectId: 'cas-delivery',
    storageBucket: 'cas-delivery.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication4',
  );
}