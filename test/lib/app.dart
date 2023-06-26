import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:test/app_state_wrapper.dart';
import 'package:test/router/index.dart';
import 'package:test/services/index.dart';
import 'package:test/styles/index.dart';

class Test extends StatelessWidget {
  Test({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: AppTheme.getAppTheme(context),
        routerConfig: _appRouter.config(
          navigatorObservers: () => [RouterObserver()],
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
