//Colors Type
import 'package:flutter/material.dart';

enum ColorType {
  basic,
  primary,
  accent,
  warn,
}

class ColorParams {
  final Color backgroundColor;
  final Color foregroundColor;

  ColorParams({required this.backgroundColor, required this.foregroundColor});
}

ColorParams getColorsFromType(ColorType type) {
  switch (type) {
    case ColorType.accent:
      return ColorParams(
          backgroundColor: Colors.white, foregroundColor: Colors.black);

    case ColorType.warn:
      return ColorParams(
          backgroundColor: Colors.red, foregroundColor: Colors.white);

    case ColorType.primary:
    default:
      return ColorParams(
          backgroundColor: Colors.black, foregroundColor: Colors.white);
  }
}
