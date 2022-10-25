//Colors Type
import 'package:flutter/material.dart';

enum UpColorType {
  basic,
  primary,
  accent,
  dark,
  warn,
}

class ColorParams {
  final Color backgroundColor;
  final Color foregroundColor;

  ColorParams({required this.backgroundColor, required this.foregroundColor});
}

ColorParams getColorsFromType(UpColorType type) {
  switch (type) {
    case UpColorType.accent:
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
