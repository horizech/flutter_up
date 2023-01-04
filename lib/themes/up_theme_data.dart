import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpThemeData {
  int id;
  ThemeData themeData;

  UpStyle primary;
  UpStyle? secondary;
  UpStyle? tertiary;
  UpStyle? warn;
  UpStyle? disabled;
  UpStyle? link;

  UpThemeData({
    required this.id,
    required this.themeData,
    required this.primary,
    this.secondary,
    this.tertiary,
    this.warn,
    this.disabled,
    this.link,
  });
}
