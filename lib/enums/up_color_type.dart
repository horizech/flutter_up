//Colors Type
import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

enum UpColorType {
  primary,
  secondary,
  tertiary,
  // dark,
  basic,
  warn,
  success,
  link,
}

class ColorParams {
  final Color backgroundColor;
  final Color foregroundColor;

  ColorParams({required this.backgroundColor, required this.foregroundColor});
}

ColorParams getColorsFromType(UpColorType type) {
  switch (type) {
    case UpColorType.secondary:
      return ColorParams(
          backgroundColor: Colors.white, foregroundColor: Colors.black);

    case UpColorType.warn:
      return ColorParams(
          backgroundColor: Colors.red, foregroundColor: Colors.white);

    case UpColorType.primary:
    default:
      return ColorParams(
          backgroundColor: Colors.black, foregroundColor: Colors.white);
  }
}

UpStyle getStyleByType(UpThemeData data, UpColorType? type) {
  switch (type) {
    case UpColorType.secondary:
      return data.secondaryStyle ?? data.primaryStyle;

    case UpColorType.warn:
      return data.warnStyle ?? data.primaryStyle;

    case UpColorType.success:
      return data.successStyle ?? data.primaryStyle;

    case UpColorType.basic:
      return data.basicStyle ?? data.primaryStyle;

    case UpColorType.link:
      return data.linkStyle ?? data.primaryStyle;
    case UpColorType.tertiary:
      return data.tertiaryStyle ?? data.primaryStyle;

    case UpColorType.primary:
    default:
      return data.primaryStyle;
  }
}
