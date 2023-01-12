import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/models/up_route.dart';
import 'package:flutter_up/themes/up_theme_data.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:go_router/go_router.dart';
import 'services/up_navigation.dart';

class FlutterUpApp extends StatelessWidget {
  final String title;
  final UpThemeData theme;
  final List<UpRoute> upRoutes;
  final String? initialRoute;
  GlobalKey<NavigatorState>? parentNavigatorKey;

  FlutterUpApp({
    Key? key,
    this.title = "",
    required this.theme,
    required this.upRoutes,
    this.initialRoute,
    this.parentNavigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterUpConfig(
      theme: theme,
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
      ),
    );
  }
}
