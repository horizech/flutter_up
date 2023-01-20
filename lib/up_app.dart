import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/models/up_route.dart';
import 'package:flutter_up/themes/up_theme_data.dart';
import 'package:go_router/go_router.dart';
import 'services/up_navigation.dart';

class UpApp extends StatefulWidget {
  final String title;
  final UpThemeData theme;
  final List<UpRoute> upRoutes;
  final String? initialRoute;
  GlobalKey<NavigatorState>? parentNavigatorKey;

  UpApp({
    Key? key,
    this.title = "",
    required this.theme,
    required this.upRoutes,
    this.initialRoute,
    this.parentNavigatorKey,
  }) : super(key: key);

  @override
  State<UpApp> createState() => _UpAppState();
}

class _UpAppState extends State<UpApp> {
  @override
  Widget build(BuildContext context) {
    return UpConfig(
      theme: widget.theme,
      child: MaterialApp.router(
        routerConfig: GoRouter(
          navigatorKey: ServiceManager.isRegistered<UpNavigationService>()
              ? (ServiceManager<UpNavigationService>().navigatorKey)
              : GlobalKey<NavigatorState>(),
          routes: UpRoute.generateRoutes(
            widget.upRoutes,
            widget.parentNavigatorKey,
          ),
          initialLocation: widget.initialRoute,
        ),
        debugShowCheckedModeBanner: false,
        title: widget.title,
      ),
    );
  }
}
