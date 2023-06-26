import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.title,
    this.fab,
    required this.body,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: fab,
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
