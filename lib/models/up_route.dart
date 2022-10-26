import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpRoute {
  final String path;
  final Widget widget;
  final String? name;
  final Function? shouldRedirect;
  final String? redirectRoute;
  final List<UpRoute>? routes;

  UpRoute({
    this.name,
    required this.path,
    required this.widget,
    this.shouldRedirect,
    this.redirectRoute,
    this.routes,
  });

  static List<RouteBase> generateRoutes(List<UpRoute> upRoutes) {
    List<RouteBase> routes = upRoutes
        .map(
          (e) => GoRoute(
            path: e.path,
            builder: (BuildContext context, GoRouterState state) => e.widget,
            name: e.name,
            routes: e.routes != null && e.routes!.isNotEmpty
                ? generateRoutes(e.routes!)
                : <RouteBase>[],
            redirect: (context, state) {
              if (e.shouldRedirect != null && e.redirectRoute != null) {
                if (e.shouldRedirect!()) {
                  return e.redirectRoute;
                } else {
                  return null;
                }
              } else {
                return null;
              }
            },
          ),
        )
        .toList();

    return routes;
  }
}
