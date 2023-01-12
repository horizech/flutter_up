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

  UpStyle primaryStyle;
  UpStyle? secondaryStyle;
  UpStyle? tertiaryStyle;
  UpStyle? warnStyle;
  UpStyle? linkStyle;
  UpStyle? successStyle;

  UpThemeData({
    // required this.themeData,
    required this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.warnColor,
    this.linkColor,
    this.successColor,
    required this.primaryStyle,
    this.secondaryStyle,
    this.tertiaryStyle,
    this.successStyle,
    this.warnStyle,
    this.linkStyle,
  });
}
