import 'package:flutter/material.dart';
import 'package:twitter_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple,
        actions: [
          TextButton.icon(
            label: Text('Sign Out'),
            icon: Icon(Icons.person),
            onPressed: () async {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
