import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class FlutterUpConfig extends InheritedWidget {
  final UpThemeData themeData;

  const FlutterUpConfig({
    Key? key,
    required this.themeData,
    required child,
  }) : super(key: key, child: child);

  static FlutterUpConfig? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FlutterUpConfig>());
  }

  @override
  bool updateShouldNotify(FlutterUpConfig oldWidget) {
    //return true;
    return themeData != oldWidget.themeData;
  }
}
