//Colors Type
import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

enum UpToastType {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  custom,
}

class UpToastParams {
  final Color backgroundColor;
  final Color foregroundColor;
  Icon? icon;

  UpToastParams({
    required this.backgroundColor,
    required this.foregroundColor,
    this.icon,
  });
}

UpToastParams getToast(BuildContext context, UpToastType type,
    {UpColorType? colorType, UpStyle? style}) {
  switch (type) {
    case UpToastType.secondary:
      return UpToastParams(
        backgroundColor: UpStyle.getToastBackgroundColor(context,
            colorType: UpColorType.secondary, style: style),
        foregroundColor: UpStyle.getToastTextColor(context,
            colorType: UpColorType.secondary, style: style),
        icon: null,
      );
    case UpToastType.danger:
      return UpToastParams(
        backgroundColor: Colors.red[200]!,
        foregroundColor: const Color.fromARGB(255, 79, 6, 1),
        icon: const Icon(
          Icons.dangerous,
          color: Color.fromARGB(255, 79, 6, 1),
        ),
      );
    case UpToastType.success:
      return UpToastParams(
        backgroundColor: Colors.green[200]!,
        foregroundColor: Colors.green,
        icon: const Icon(
          Icons.done,
          color: Colors.green,
        ),
      );
    case UpToastType.warning:
      return UpToastParams(
        backgroundColor: Colors.orange[200]!,
        foregroundColor: Colors.orange,
        icon: const Icon(
          Icons.warning,
          color: Colors.orange,
        ),
      );
    case UpToastType.light:
      return UpToastParams(
        backgroundColor: const Color.fromARGB(255, 199, 196, 196),
        foregroundColor: Colors.black,
        icon: null,
      );
    case UpToastType.info:
      return UpToastParams(
        backgroundColor: Colors.blue[200]!,
        foregroundColor: Colors.blue,
        icon: const Icon(
          Icons.info,
          color: Colors.blue,
        ),
      );
    case UpToastType.dark:
      return UpToastParams(
        backgroundColor: const Color.fromARGB(221, 39, 38, 38),
        foregroundColor: Colors.black,
        icon: null,
      );
    case UpToastType.custom:
      return UpToastParams(
          backgroundColor: UpStyle.getToastBackgroundColor(context,
              colorType: colorType, style: style),
          foregroundColor: UpStyle.getToastTextColor(context,
              colorType: UpColorType.primary),
          icon: null);
    case UpToastType.primary:
    default:
      return UpToastParams(
        backgroundColor: UpStyle.getToastBackgroundColor(context,
            colorType: UpColorType.primary),
        foregroundColor:
            UpStyle.getToastTextColor(context, colorType: UpColorType.primary),
        icon: null,
      );
  }
}
