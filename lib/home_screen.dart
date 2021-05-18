import 'package:flutter/material.dart';
import 'package:twitter_app/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You are logged in!'),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Center(
              child: Text('Sign out'),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white // foreground
                ),
          ),
        ],
      ),
    );
  }
}
