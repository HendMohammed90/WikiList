import 'package:flutter/material.dart';
import 'package:wiki_app/ui/screens/loginScreen/login_screen.dart';
import 'package:wiki_app/ui/screens/userScreen/users_screen.dart';
import 'package:wiki_app/utilities/http_wrapper.dart';

import 'oldWiki/home_page.dart';
import 'ui/screens/authScreen/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color(0xFF6F35A5),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFF6F35A5),
          ),
        ),
      ),
      title: 'Users List',
      home: LoginScreen(),
    );
  }
}
