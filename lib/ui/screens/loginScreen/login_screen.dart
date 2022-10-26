import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiki_app/repos/login.dart';
import '../../../models/req_model.dart';
import '../../../models/response.dart';
import '../../components/background.dart';
import '../error_screen.dart';
import '../userScreen/users_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginModel? _loginResponse;
  String tokenItem = '';

  late LoginReqModel reqModel;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscurePassword;
  late bool _autovalidate;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reqModel = new LoginReqModel();
    _obscurePassword = true;
    _autovalidate = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Color(0xFF6F35A5),
                    onFieldSubmitted: (val) => {reqModel.email = val},
                    onSaved: (val) => {reqModel.email = val},
                    onChanged: (val) => {reqModel.email = val},
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your email",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    onFieldSubmitted: (val) => {reqModel.password = val},
                    onSaved: (val) => {reqModel.password = val},
                    onChanged: (val) => {reqModel.password = val},
                    textInputAction: TextInputAction.done,
                    // obscureText: true,
                    cursorColor: Color(0xFF6F35A5),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // print(reqModel.toJson());
                    _loginResponse = await Login().loginn(reqModel);
                    if (_loginResponse!.data!.token != null) {
                      print('Success');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserScreen(
                            token: tokenItem,
                          ),
                        ),
                      );
                    } else {
                      // var snackBar =
                      //     const SnackBar(content: Text('Error has happend'));
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ErrorScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login".toUpperCase(),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF6F35A5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// {email: eve.holt@reqres.in, password: citylicka}
