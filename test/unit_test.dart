import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  group('ValidationLoginWithFirebase -', () {
    test('When sending null data from  inputs of login page', () async {
      var auth = AuthService();
      expect(auth.signInWithEmailAndPassword("", "", context), null);
    });
  });
}
