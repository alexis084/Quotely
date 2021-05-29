import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_app/models/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userFromFireBaseUser(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Stream<UserModel> get user {
    return auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user.uid)
          .set({'name': email, 'email': email});
      _userFromFireBaseUser(user.user);
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

  Future signIn(String email, String password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )) as User;

      _userFromFireBaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
