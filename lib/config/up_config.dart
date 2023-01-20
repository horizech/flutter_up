import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

// ignore: must_be_immutable
class UpConfig extends InheritedWidget {
  UpThemeData theme;

  UpConfig({
    Key? key,
    required this.theme,
    required child,
  }) : super(key: key, child: child);

  static UpConfig? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<UpConfig>());
  }

  static void changeTheme(BuildContext context, UpThemeData newTheme) {
    (context.dependOnInheritedWidgetOfExactType<UpConfig>())!.theme = newTheme;
  }

  @override
  bool updateShouldNotify(UpConfig oldWidget) {
    return true;
    // return theme != oldWidget.theme;
  }
}
