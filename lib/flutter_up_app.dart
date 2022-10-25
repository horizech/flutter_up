import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'services/up_navigation.dart';

class FlutterUpApp extends StatelessWidget {
  final ThemeCollection? themeCollection;
  final int? defaultThemeId;
  final String title;
  final Widget? home;
  final Map<String, Widget Function(BuildContext)> routes;
  final String? initialRoute;

  const FlutterUpApp({
    Key? key,
    this.themeCollection,
    this.defaultThemeId,
    this.title = "",
    this.home,
    required this.routes,
    this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (themeCollection != null && defaultThemeId == null) {
      throw ("Please provide defaultThemeId!");
    }

    return DynamicTheme(
      themeCollection: themeCollection ?? UpThemes.predefinedThemesCollection,
      defaultThemeId: defaultThemeId ?? UpThemes.light.id,
      builder: (context, theme) {
        return FlutterUpConfig(
          child: MaterialApp(
            navigatorKey: ServiceManager.isRegistered<UpNavigationService>()
                ? ServiceManager<UpNavigationService>().navigatorKey
                : GlobalKey<NavigatorState>(),
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
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
