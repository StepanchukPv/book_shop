import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_inv/app.dart';
import 'package:sentry_inv/core/observer/sentry_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = SentryBlocObserver();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c8767713614a49b8ac5246570ca440ec@o1294094.ingest.sentry.io/4504774077054976';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      const SentryInv(),
    ),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}
