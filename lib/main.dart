import 'package:flutter/material.dart';
import 'package:wiki_app/ui/screens/loginScreen/login_screen.dart';
import 'package:wiki_app/ui/screens/userScreen/users_screen.dart';
import 'package:wiki_app/utilities/http_wrapper.dart';

import 'oldWiki/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users List',
      home: LoginScreen(),
    );
  }
}
