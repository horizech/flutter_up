import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class UpConstants {
  static int kDefaultMobileLimit = 640;
  static int kDefaultTabletLimit = 1200;

  static UpThemeData kDefaultTheme = UpThemes.generateThemeByColor(
    baseColor: Colors.white,
    primaryColor: Colors.black,
  );

  static Color kDefaultStyleBackgroundColor = Colors.black;
  static Color kDefaultStyleBorderColor = Colors.transparent;
  static double kDefaultStyleBorderWidth = 1;
  static double kDefaultStyleTextSize = 12;
  static double kDefaultStyleTextStrokeWidth = 1;
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
  static double kDefaultStyleButtonWidth = 320.0;
  static double kDefaultStyleCardWidth = 320.0;
  static double kDefaultStyleCardHeight = 320.0;
  static double kDefaultStyleCardRadius = 6;
  static double kDefaultStyleSideBarRadius = 0;
  static double kDefaultStyleSideBarDefaultViewWithPercentage = 25;
  static double kDefaultStyleSideBarRightSideWidthPercentage = 75;
  static double kDefaultStyleSideBarCompactViewWith = 60;
  static double kDefaultStyleSideBarMaximumScreenWidthForCompactView = 900;
  static IconData kDefaultStylefixedDrawerToggleIcon = Icons.menu;
  static double kDefaultStyleFixedDrawerToggleIconPadding = 20;
  static double kDefaultStyleFixedDrawerToggleIconSize = 32;
  static Color kDefaultStyleFixedDrawerToggleIconColor = Colors.black;

  static double kDefaultStyleButtonHeight = 48.0;
  static double kDefaultStyleHeading1Size = 40.0;
  static double kDefaultStyleHeading2Size = 35.0;
  static double kDefaultStyleHeading3Size = 30.0;
  static double kDefaultStyleHeading4Size = 25.0;
  static double kDefaultStyleHeading5Size = 20.0;
  static double kDefaultStyleHeading6Size = 18.0;
  static double kDefaultStyleParagrahSize = 14.0;
  static double kDefaultStyleDefaultTextSize = 14.0;
  static FontWeight kDefaultStyleHeading1Weight = FontWeight.bold;
  static FontWeight kDefaultStyleHeading2Weight = FontWeight.w700;
  static FontWeight kDefaultStyleHeading3Weight = FontWeight.w600;
  static FontWeight kDefaultStyleHeading4Weight = FontWeight.w400;
  static FontWeight kDefaultStyleHeading5Weight = FontWeight.w300;
  static FontWeight kDefaultStyleHeading6Weight = FontWeight.w200;
  static FontWeight kDefaultStyleParagraphWeight = FontWeight.normal;
  static FontWeight kDefaultStyleDefaultTextWeight = FontWeight.normal;
}
