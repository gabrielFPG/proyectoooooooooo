import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyDVg1IIlsG-M_KFPwSkTnTG_SB6MMuFP7c',
    appId: '1:20015886923:web:991f1a891b68b52f7993ce',
    messagingSenderId: '20015886923',
    projectId: 'wikifood-9fb3b',
    authDomain: 'wikifood-9fb3b.firebaseapp.com',
    storageBucket: 'wikifood-9fb3b.firebasestorage.app',
    measurementId: 'G-80964BEZF8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQRE9tuyaNNQNiXwy2PpsQoXGGKM9utiw',
    appId: '1:20015886923:android:0bfaef0f7cb2d2e67993ce',
    messagingSenderId: '20015886923',
    projectId: 'wikifood-9fb3b',
    storageBucket: 'wikifood-9fb3b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVQLawfchdhGCvjnFaClegK4dYejH9Byk',
    appId: '1:20015886923:ios:46392ce014f099787993ce',
    messagingSenderId: '20015886923',
    projectId: 'wikifood-9fb3b',
    storageBucket: 'wikifood-9fb3b.firebasestorage.app',
    iosBundleId: 'com.codigocorrecto.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVQLawfchdhGCvjnFaClegK4dYejH9Byk',
    appId: '1:20015886923:ios:46392ce014f099787993ce',
    messagingSenderId: '20015886923',
    projectId: 'wikifood-9fb3b',
    storageBucket: 'wikifood-9fb3b.firebasestorage.app',
    iosBundleId: 'com.codigocorrecto.crud',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7d7VD8HQsCa0fiEclYjDHEvjkHhR9kTU',
    appId: '1:20015886923:web:9f80fc74dbd328b37993ce',
    messagingSenderId: '20015886923',
    projectId: 'wikifood-9fb3b',
    authDomain: 'wikifood-9fb3b.firebaseapp.com',
    storageBucket: 'wikifood-9fb3b.firebasestorage.app',
    measurementId: 'G-67JBT9HK7M',
  );

}