import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:test_proj/app_state_wrapper.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/styles/index.dart';

class TestProj extends StatelessWidget {
  TestProj({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Test Proj',
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
