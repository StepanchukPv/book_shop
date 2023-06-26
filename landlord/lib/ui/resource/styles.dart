import 'package:flutter/material.dart';

/// Styles for text(colors, styles, dimensions)
class ResourceTextStyle {
  const ResourceTextStyle._();

  // colors
  static const Color COLOR = Color(0xff333333);
  static const PRIMARY_1 = Color(0xfff0bc62);

  // fonts
  static const String FONT_UBUNTU = 'Ubuntu';

  // styles
  static TextStyle get normal => TextStyle(
        color: COLOR,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get light => normal.copyWith(
        fontWeight: FontWeight.w300,
      );

  static TextStyle get medium => normal.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get mediumOverline => medium.copyWith(
        fontSize: 18,
      );

  static TextStyle get bold => normal.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => bold.copyWith(
        fontSize: 22,
      );

  static TextStyle get mainTitle => bold.copyWith(
        fontSize: 28,
      );
}
