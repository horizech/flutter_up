import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

// ignore: must_be_immutable
class FlutterUpConfig extends InheritedWidget {
  UpThemeData theme;

  FlutterUpConfig({
    Key? key,
    required this.theme,
    required child,
  }) : super(key: key, child: child);

  static FlutterUpConfig? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FlutterUpConfig>());
  }

  changeTheme(UpThemeData newTheme) {
    theme = newTheme;
  }

  @override
  bool updateShouldNotify(FlutterUpConfig oldWidget) {
    //return true;
    return theme != oldWidget.theme;
  }
}
