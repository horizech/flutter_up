import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class FlutterUpConfig extends InheritedWidget {
  final UpThemeData theme;

  const FlutterUpConfig({
    Key? key,
    required this.theme,
    required child,
  }) : super(key: key, child: child);

  static FlutterUpConfig? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FlutterUpConfig>());
  }

  @override
  bool updateShouldNotify(FlutterUpConfig oldWidget) {
    //return true;
    return theme != oldWidget.theme;
  }
}
