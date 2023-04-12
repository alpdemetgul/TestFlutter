import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_colarx/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late FirebaseAuth _auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleClick() async {
    try {
      var _userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      print('Created User: ' + _userCredentials.user.toString());

      Navigator.pop(context);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    super.initState();
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
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ));
  }
}
