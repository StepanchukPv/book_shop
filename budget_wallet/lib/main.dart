import 'package:budget_wallet/router/app_router.gr.dart';
import 'package:budget_wallet/styles/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BudgetWalletApp());
}

class BudgetWalletApp extends StatelessWidget {
  BudgetWalletApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Budged Wallet',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.getThemeData(),
    );
  }
}
