import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sentry_presentation/screen/home/home_scree.dart';

class SentryPresentationApp extends StatelessWidget {
  const SentryPresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const HomeScreen(),
    );
  }
}
