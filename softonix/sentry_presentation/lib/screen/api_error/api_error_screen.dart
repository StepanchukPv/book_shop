import 'package:flutter/material.dart';
import 'package:sentry_presentation/screen/api_error/error_repository.dart';
import 'package:sentry_presentation/services/http/http_client.dart';

class ApiErrorScreen extends StatelessWidget {
  const ApiErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api error'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              final httpClient = HttpClient();

              final repository = ErrorRepository(httpClient: httpClient);

              repository.getMe();
            },
            child: const Text('Api call'),
          ),
        ],
      ),
    );
  }
}
