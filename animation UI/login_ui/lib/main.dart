import 'package:flutter/material.dart';
import 'package:login_ui/screen/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
