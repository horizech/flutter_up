import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpThemeData {
  // ThemeData themeData;
  MaterialColor primaryColor;
  MaterialColor? secondaryColor;
  MaterialColor? tertiaryColor;
  MaterialColor? warnColor;
  MaterialColor? linkColor;
  MaterialColor? successColor;
  MaterialColor? basicColor;
  MaterialColor baseColor;
  bool isDark;

  UpStyle primaryStyle;
  UpStyle? secondaryStyle;
  UpStyle? tertiaryStyle;
  UpStyle? warnStyle;
  UpStyle? linkStyle;
  UpStyle? successStyle;
  UpStyle? basicStyle;

  UpThemeData({
    // required this.themeData,
    required this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.warnColor,
    this.basicColor,
    this.linkColor,
    required this.baseColor,
    this.successColor,
    required this.primaryStyle,
    this.secondaryStyle,
    this.tertiaryStyle,
    this.successStyle,
    this.warnStyle,
    this.linkStyle,
    this.basicStyle,
    required this.isDark,
  });
}
