import 'package:flutter/material.dart';
import 'package:sentry_presentation/screen/api_error/api_error_screen.dart';

import '../ui_error/ui_error_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentry'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            child: const Text('UI Error'),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (_) => const UIErrorScreen(),
              );

              Navigator.push(context, route);
            },
          ),
          ElevatedButton(
            child: const Text('API Error'),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (_) => const ApiErrorScreen(),
              );

              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
