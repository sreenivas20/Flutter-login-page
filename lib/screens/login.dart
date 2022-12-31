//import 'dart:js';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: !_isDataMatched,
                    child: const Text(
                      'username password doesnot match',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('Field is Required');
                      }
                    },
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'sreenivas' && _password == '123') {
      print('Username pass  match');

      final _sharedprefs = await SharedPreferences.getInstance();

      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      setState(() {
        _isDataMatched = false;
        print('ihhi');
      });
    }
  }
}
