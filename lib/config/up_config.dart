import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';
import 'package:flutter_up/up_app.dart';

// ignore: must_be_immutable
class UpConfig extends InheritedWidget {
  final UpThemeData theme;
  final UpAppState flutterUp;

  const UpConfig({
    Key? key,
    required this.theme,
    required this.flutterUp,
    required child,
  }) : super(key: key, child: child);

  static UpConfig of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<UpConfig>())!;
  }

  static void changeTheme(BuildContext context, UpThemeData newTheme) {
    of(context).flutterUp.changeTheme(newTheme);
  }

  @override
  bool updateShouldNotify(UpConfig oldWidget) {
    return theme != oldWidget.theme;
  }
}
