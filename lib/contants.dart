import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class UpConstants {
  static int kDefaultMobileLimit = 640;
  static int kDefaultTabletLimit = 1200;

  static UpThemeData kDefaultTheme = UpThemes.generateThemeByColor(
    primaryColor: Colors.black,
  );

  static Color kDefaultStyleBackgroundColor = Colors.black;
  static Color kDefaultStyleBorderColor = Colors.transparent;
  static double kDefaultStyleBorderWidth = 1;
  static double kDefaultStyleTextSize = 12;

  static Color kDefaultStyleForegroundColor = Colors.white;
  static double kDefaultStyleBorderRadius = 18;
  static bool kDefaultStyleIsRounded = false;
  static bool kDefaultStyleIsDisabled = false;
  static double kDefaultStyleIconSize = 12;
  static Color kDefaultStyleDisabledBackgroundColor =
      Colors.grey[300] ?? Colors.grey;
  static Color kDefaultStyleDisabledForegroundColor =
      Colors.grey.withAlpha(100);
  static Color kDefaultStyleDisabledBorderColor = Colors.grey;
}
