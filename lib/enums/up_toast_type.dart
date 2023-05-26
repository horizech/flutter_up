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

UpStyle getToastStyle(BuildContext context, UpToastType type,
    {UpColorType? colorType, UpStyle? style}) {
  switch (type) {
    case UpToastType.secondary:
      return UpStyle(
        toastBackgroundColor: UpStyle.getToastBackgroundColor(context,
            colorType: UpColorType.secondary, style: style),
        toastForegroundColor: UpStyle.getToastTextColor(context,
            colorType: UpColorType.secondary, style: style),
        toastIcon: null,
      );
    case UpToastType.danger:
      return UpStyle(
        toastBackgroundColor: Colors.red[200]!,
        toastForegroundColor: const Color.fromARGB(255, 79, 6, 1),
        toastIcon: const Icon(
          Icons.dangerous,
          color: Color.fromARGB(255, 79, 6, 1),
        ),
      );
    case UpToastType.success:
      return UpStyle(
        toastBackgroundColor: Colors.green[200]!,
        toastForegroundColor: Colors.green,
        toastIcon: const Icon(
          Icons.done,
          color: Colors.green,
        ),
      );
    case UpToastType.warning:
      return UpStyle(
        toastBackgroundColor: Colors.orange[200]!,
        toastForegroundColor: Colors.orange,
        toastIcon: const Icon(
          Icons.warning,
          color: Colors.orange,
        ),
      );
    case UpToastType.light:
      return UpStyle(
        toastBackgroundColor: const Color.fromARGB(255, 199, 196, 196),
        toastForegroundColor: Colors.black,
        toastIcon: null,
      );
    case UpToastType.info:
      return UpStyle(
        toastBackgroundColor: Colors.blue[200]!,
        toastForegroundColor: Colors.blue,
        toastIcon: const Icon(
          Icons.info,
          color: Colors.blue,
        ),
      );
    case UpToastType.dark:
      return UpStyle(
        toastBackgroundColor: const Color.fromARGB(221, 39, 38, 38),
        toastForegroundColor: Colors.black,
        toastIcon: null,
      );
    case UpToastType.custom:
      return UpStyle(
          toastBackgroundGradient: UpStyle.getToastBackgroundGradient(context,
              colorType: colorType, style: style),
          toastBackgroundColor: UpStyle.getToastBackgroundColor(context,
              colorType: colorType, style: style),
          toastForegroundColor: UpStyle.getToastTextColor(context,
              colorType: UpColorType.primary, style: style),
          toastIcon: null);
    case UpToastType.primary:
    default:
      return UpStyle(
        toastBackgroundColor: UpStyle.getToastBackgroundColor(context,
            colorType: UpColorType.primary, style: style),
        toastForegroundColor: UpStyle.getToastTextColor(context,
            colorType: UpColorType.primary, style: style),
        toastIcon: null,
      );
  }
}
