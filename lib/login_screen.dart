import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_colarx/screens/login_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth _auth;
  final String _email = 'test1234@hotmail.com';
  final String _password = 'Test1234';

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              handleClickLogin();
            },
            child: Text('Login')),
        ElevatedButton(
            onPressed: () {
              handleClickRegister();
            },
            child: Text('Register'))
      ],
    )));
  }

  void handleClickLogin() async {
    try {
      // var _userCredentials = await _auth.signInWithEmailAndPassword(
      //     email: _email, password: _password);
      // var _user = _userCredentials.user;
      // print(_user.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {
      print(e.toString());
    }
  }

  void handleClickRegister() async {
    try {
      var _userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      var _user = _userCredentials.user;
      print(_user.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
