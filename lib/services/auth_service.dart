import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_app/const/alertStyle.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  late String errorMessage;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int? counter = 0;
  late SharedPreferences prefs;

  User? _userfirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return firebaseAuth.authStateChanges().map(_userfirebase);
  }

  Future<User?> signInWithEmailAndPassword(email, password, context) async {
    try {
      final credentials = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      prefs = await _prefs;

      if (prefs.getInt('logins_counter') != null) {
        counter = (prefs.getInt('logins_counter')! + 1);
      } else {
        counter = 1;
      }

      prefs.setInt('logins_counter', counter!);
      return _userfirebase(credentials.user);
    } on auth.FirebaseAuthException catch (e) {
      print(e.code);
      var errorCode = e.code;
      var errorMessage = e.message;
      if (errorCode == 'auth/wrong-password') {
        errorMessage = 'Wrong password.';
      }

      Alert(
        context: context,
        style: alertStyle,
        // type: AlertType.success,
        title: "Error",
        image: Icon(
          Icons.warning_sharp,
          color: declineColor,
          size: 50,
        ),
        content: Text(errorMessage!),
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            color: const Color.fromRGBO(50, 80, 120, 1.0),
            radius: BorderRadius.circular(25),
          ),
        ],
      ).show();
    }
  }

  exceptionMessage(message) {
    return message;
  }

  Future<User?> createUserWithEmailAndPassword(email, password, context) async {
    try {
      final credentials = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      prefs = await _prefs;

      if (prefs.getInt('logins_counter') != null) {
        counter = (prefs.getInt('logins_counter')! + 1);
      } else {
        counter = 1;
      }

      prefs.setInt('logins_counter', counter!);

      return _userfirebase(credentials.user);
    } on auth.FirebaseAuthException catch (e) {
      print(e.code);
      var errorCode = e.code;
      var errorMessage = e.message;
      if (errorCode == 'auth/wrong-password') {
        errorMessage = 'The password is too weak.';
      }
      Alert(
        context: context,
        style: alertStyle,
        // type: AlertType.success,
        title: "Error",
        image: Icon(
          Icons.warning_sharp,
          color: declineColor,
          size: 50,
        ),
        content: Text(errorMessage!),
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            color: const Color.fromRGBO(50, 80, 120, 1.0),
            radius: BorderRadius.circular(25),
          ),
        ],
      ).show();
    }
  }

  Future<void> singOut() async {
    try {
      return await firebaseAuth.signOut();
    } on auth.FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}
