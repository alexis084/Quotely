import 'package:flutter/material.dart';
import 'package:twitter_app/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Login to Notter'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign up'),
            onPressed: () {
              setState(() {
                AuthService().setShowLogin(false);
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: 300.0,
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 20.0,
                        bottom: 5.0,
                      ),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Email'),
                          validator: (value) => value.isEmpty
                              ? 'Email is required'
                              : validateEmail(value.trim()),
                          onChanged: (value) {
                            this.email = value;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 20.0,
                        bottom: 5.0,
                      ),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password'),
                          validator: (value) =>
                              value.isEmpty ? 'Password is required' : null,
                          onChanged: (value) {
                            this.password = value;
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (checkFields()) {
                          AuthService().signIn(email, password);
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                        ),
                        child: Center(
                          child: Text('Sign in'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
