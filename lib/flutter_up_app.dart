import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';

class FlutterUpApp extends StatelessWidget {
  final ThemeCollection themeCollection;
  final int defaultThemeId;
  final String title;
  final Widget? home;
  final Map<String, Widget Function(BuildContext)> routes;

  const FlutterUpApp({
    Key? key,
    required this.themeCollection,
    this.defaultThemeId = 0,
    this.title = "",
    this.home,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      themeCollection: themeCollection,
      defaultThemeId: defaultThemeId,
      builder: (context, theme) {
        return FlutterUpConfig(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: routes,
            title: title,
            theme: theme,
            home: home,
          ),
        );
      },
    );
  }
}
