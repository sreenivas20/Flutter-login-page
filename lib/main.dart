//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}
