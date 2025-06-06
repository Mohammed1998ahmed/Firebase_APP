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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5PNabpD5kERn-d2oTXcH0NbZgPJRhyC4',
    appId: '1:816281024681:android:f4de774d2e41f76d60d1b8',
    messagingSenderId: '816281024681',
    projectId: 'advanced-flutter-f9139',
    storageBucket: 'advanced-flutter-f9139.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARIoS972jAyM61c7Wm15BzdiujdL28_qw',
    appId: '1:816281024681:ios:9cc19f4441ecceaf60d1b8',
    messagingSenderId: '816281024681',
    projectId: 'advanced-flutter-f9139',
    storageBucket: 'advanced-flutter-f9139.firebasestorage.app',
    androidClientId: '816281024681-4bfq2abpub0eql1ugk70og51e61f8fgu.apps.googleusercontent.com',
    iosClientId: '816281024681-tcvdrjifetkbvf9img6e0qko3qdo5e1c.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseApp',
  );
}
