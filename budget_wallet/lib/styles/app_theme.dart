import 'package:budget_wallet/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffold,
      textTheme: const TextTheme().apply(bodyColor: AppColors.text),
    );
  }
}
