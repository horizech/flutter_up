import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class UpConstants {
  static int kDefaultMobileLimit = 640;
  static int kDefaultTabletLimit = 1200;

  static UpThemeData kDefaultTheme = UpThemes.vintage;

  static Color kDefaultStyleBackgroundColor = Colors.black;
  static Color kDefaultStyleBorderColor = Colors.transparent;
  static double kDefaultStyleBorderWidth = 1;
  static Color kDefaultStyleForegroundColor = Colors.white;
  static double kDefaultStyleBorderRadius = 18;
  static bool kDefaultStyleIsRounded = false;
  static bool kDefaultStyleIsDisabled = false;
}
