  import 'package:flutter/material.dart';
  import 'package:landlord/ui/pages/onboarding/onboarding_page.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Ubuntu',
        ),
        home: OnBoardingPage(),
      );
    }
  }
