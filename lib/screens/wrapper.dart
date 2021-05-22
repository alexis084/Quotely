import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/models/user.dart';
import 'package:twitter_app/screens/auth/signup_screen.dart';
import 'package:twitter_app/screens/main/home.dart';
import 'package:twitter_app/screens/main/posts/add.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      //show auth system routes
      return SignUp();
    }

    //show main system routes
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add': (context) => Add(),
      },
    );
  }
}
