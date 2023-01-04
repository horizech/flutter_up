import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/models/up_route.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:go_router/go_router.dart';
import 'services/up_navigation.dart';

class FlutterUpApp extends StatelessWidget {
  final ThemeCollection? themeCollection;
  final int? defaultThemeId;
  final String title;
  final List<UpRoute> upRoutes;
  final String? initialRoute;
  GlobalKey<NavigatorState>? parentNavigatorKey;

  FlutterUpApp({
    Key? key,
    this.themeCollection,
    this.defaultThemeId,
    this.title = "",
    required this.upRoutes,
    this.initialRoute,
    this.parentNavigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (themeCollection != null && defaultThemeId == null) {
      throw ("Please provide defaultThemeId!");
    }

    return DynamicTheme(
      themeCollection: themeCollection ?? UpThemes.predefinedThemesCollection,
      defaultThemeId: defaultThemeId ?? UpThemes.vintage.id,
      builder: (context, theme) {
        return FlutterUpConfig(
          themeData: UpThemes.vintage,
          child: MaterialApp.router(
            routerConfig: GoRouter(
              navigatorKey: ServiceManager.isRegistered<UpNavigationService>()
                  ? (ServiceManager<UpNavigationService>().navigatorKey)
                  : GlobalKey<NavigatorState>(),
              routes: UpRoute.generateRoutes(
                upRoutes,
                parentNavigatorKey,
              ),
              initialLocation: initialRoute,
            ),
            debugShowCheckedModeBanner: false,
            title: title,
            theme: theme,
          ),
        );
      },
    );
  }
}
