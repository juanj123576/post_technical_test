// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'nav.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return StreamBuilder(
        stream: auth.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? logIn() : Nav();
          } else {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
