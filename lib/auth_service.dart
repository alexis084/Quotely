import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_app/home_screen.dart';
import 'package:twitter_app/login_screen.dart';
import 'package:twitter_app/register_screen.dart';

class AuthService {
  bool _showLogin = false;
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          print('Reached');
          return (_showLogin == false) ? Register() : LoginPage();
        }
      },
    );
  }

  bool getShowLogin() {
    return _showLogin;
  }

  setShowLogin(bool showLogin) {
    _showLogin = showLogin;
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }

  //Sign up
  signUp(email, password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed Up');
    }).catchError((e) {
      print(e);
    });
  }
}
