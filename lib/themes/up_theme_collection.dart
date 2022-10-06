import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

import 'dark.dart';
import 'light_blue.dart';
import 'light_red.dart';
import 'vintage.dart';

class UpThemes {
  static const int lightBlue = 0;
  static const int lightRed = 1;
  static const int dark = 2;
  static const int vintage = 3;
}

final upThemeCollection = ThemeCollection(
  themes: {
    0: lightBlueTheme,
    1: lightRedTheme,
    2: darkTheme,
    3: vintage,
  },
  fallbackTheme: ThemeData
      .light(), // optional fallback theme, default value is ThemeData.light()
);
