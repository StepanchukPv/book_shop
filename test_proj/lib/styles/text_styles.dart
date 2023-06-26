import 'package:flutter/material.dart';

import 'package:test_proj/styles/index.dart';

class AppTextStyles {
  static TextStyle get appTitle => const TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get error => const TextStyle(
        color: Colors.red,
        fontSize: 10,
        height: 0.5,
      );
}
