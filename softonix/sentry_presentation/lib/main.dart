import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_presentation/app.dart';

void main() async {
  //DSN should be stored in .env file
  await SentryFlutter.init(
    (options) => options
      ..dsn =
          'https://d9df24b646f64a679028ee287a162704@o1296170.ingest.sentry.io/6781841'
      ..release = '0.0.1',
    appRunner: () {
      return runApp(
        const SentryPresentationApp(),
      );
    },
  );
}
