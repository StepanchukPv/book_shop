import 'package:flutter/material.dart';
import 'package:rive_animations/screens/charts/charts_screen.dart';
import 'package:rive_animations/screens/custom/custom_animations_screen.dart';
import 'package:rive_animations/screens/rive/rive_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
          bottom: const TabBar(
            tabs: [
              Text('Rive'),
              Text('Custom'),
              Text('Charts'),
            ],
            labelPadding: EdgeInsets.only(bottom: 10.0),
          ),
        ),
        body: const TabBarView(
          children: [
            RiveScreen(),
            CustomAnimationScreen(),
            ChartScreen(),
          ],
        ),
      ),
    );
  }
}
