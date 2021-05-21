import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  void signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        title: Text('Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: new Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async => {
                  signUp(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
