import 'package:flutter/material.dart';
import 'package:twitter_app/auth/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('404 error has occured');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SignUp(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Loading...');
      },
    );
  }
}
