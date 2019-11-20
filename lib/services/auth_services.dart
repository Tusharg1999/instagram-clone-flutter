import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_flutter/screens/home.dart';
import 'package:instagram_clone_flutter/screens/login.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static signUpUser(BuildContext context, email, password, name) async {
    try {
      dynamic authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser _user = authResult.user;
      if (_user != null) {
        _firestore
            .collection('/users')
            .document(_user.uid)
            .setData({'name': name, 'email': email});
        Navigator.pushNamed(context, HomeScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  static signOut(BuildContext context) async {
    try {
      await _auth.signOut();
//      Navigator.pushNamed(context, LoginScreen.id);
    } catch (e) {
      print(e);
    }
  }

  static signIn(BuildContext context, email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
//      Navigator.pushNamed(context, HomeScreen.id);
    } catch (e) {
      print(e);
    }
  }
}
