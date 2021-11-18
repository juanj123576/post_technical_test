import 'package:flutter/material.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/todos_Screen.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/widgets/nav.dart';
import 'package:my_app/widgets/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostStore(), lazy: false),
        Provider(create: (_) => AuthService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper());
  }
}
