import 'package:flutter/material.dart';
import 'package:wiki_app/ui/screens/loginScreen/login_screen.dart';
import 'package:wiki_app/ui/screens/userScreen/users_screen.dart';

import '../../../utilities/cache_wrapper.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: checkForToken(),
    );
  }
}

checkForToken() async {
  String? cachedUserData = await CacheWrapper().getUserData();
  if (cachedUserData != null) {
    return UserScreen(token: cachedUserData);
  } else {
    return const LoginScreen();
  }
}
