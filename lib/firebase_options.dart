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
    apiKey: 'AIzaSyCA6MF_QT9CFusCOdQf0tLeaf3ijLeOIAs',
    appId: '1:538419604351:web:282a75b097a8dfa200c84a',
    messagingSenderId: '538419604351',
    projectId: 'e-commerce-app-f',
    authDomain: 'e-commerce-app-f.firebaseapp.com',
    storageBucket: 'e-commerce-app-f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_zkwQJ4K-fHJU3p3tOvhwocnlXO46TPo',
    appId: '1:538419604351:android:86c52617fd89267100c84a',
    messagingSenderId: '538419604351',
    projectId: 'e-commerce-app-f',
    storageBucket: 'e-commerce-app-f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqmn1MyZmez02oWcDcwzbk62uxtfY2xuw',
    appId: '1:538419604351:ios:84e6841e1686c7c200c84a',
    messagingSenderId: '538419604351',
    projectId: 'e-commerce-app-f',
    storageBucket: 'e-commerce-app-f.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceAdminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqmn1MyZmez02oWcDcwzbk62uxtfY2xuw',
    appId: '1:538419604351:ios:84e6841e1686c7c200c84a',
    messagingSenderId: '538419604351',
    projectId: 'e-commerce-app-f',
    storageBucket: 'e-commerce-app-f.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceAdminApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCA6MF_QT9CFusCOdQf0tLeaf3ijLeOIAs',
    appId: '1:538419604351:web:a4d1701496e1ca5e00c84a',
    messagingSenderId: '538419604351',
    projectId: 'e-commerce-app-f',
    authDomain: 'e-commerce-app-f.firebaseapp.com',
    storageBucket: 'e-commerce-app-f.firebasestorage.app',
  );

}