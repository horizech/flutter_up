//Colors Type
import 'package:flutter/material.dart';

enum UpToastType {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
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

UpToastParams getToast(BuildContext context, UpToastType type) {
  switch (type) {
    case UpToastType.secondary:
      return UpToastParams(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).primaryColor,
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
        backgroundColor: Colors.white,
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
    case UpToastType.primary:
      return UpToastParams(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        icon: null,
      );
    default:
      return UpToastParams(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        icon: null,
      );
  }
}
