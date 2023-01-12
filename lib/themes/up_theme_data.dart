import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpThemeData {
  // ThemeData themeData;

  Color primaryColor;
  Color? secondaryColor;
  Color? tertiaryColor;
  Color? warnColor;
  Color? linkColor;
  Color? successColor;

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
