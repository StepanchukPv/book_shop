import 'dart:math';

import 'package:flutter/material.dart';

class UIErrorScreen extends StatelessWidget {
  const UIErrorScreen({super.key});

  Color get _randomColor {
    final random = Random();

    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overflow'),
      ),
      body: Column(
        children: List.generate(
          40,
          (index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              height: 100,
              width: double.infinity,
              color: _randomColor,
            );
          },
        ),
      ),
    );
  }
}
