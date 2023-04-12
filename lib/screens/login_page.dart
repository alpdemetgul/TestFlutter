import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth _auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? _user;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void handleClick() async {
    try {
      var _userCredentials = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      setState(() {
        _user = _userCredentials.user;
      });
      print(_user.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  controller: _passwordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    handleClick();
                  },
                  child: Text('Login'),
                ),
                if (_user != null)
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('User Id: ' + _user!.uid.toString()),
                        Divider(),
                        Text('User Email: ' + _user!.email.toString())
                      ],
                    ),
                  ))
              ],
            ),
          ),
        ));
  }
}
