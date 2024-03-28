import 'package:flutter/material.dart';
import 'package:flutter_up/models/up_router_state.dart';
import 'package:flutter_up/services/up_url.dart';
import 'package:go_router/go_router.dart';

class UpRoute {
  final String path;
  final Widget Function(BuildContext, UpRouterState) pageBuilder;
  final String? name;
  final Function? shouldRedirect;
  final String? redirectRoute;
  final bool externalRoute;
  final List<UpRoute>? routes;

  UpRoute({
    this.name,
    required this.path,
    required this.pageBuilder,
    this.shouldRedirect,
    this.redirectRoute,
    this.routes,
    this.externalRoute = false,
  });

  static List<RouteBase> generateRoutes(
      List<UpRoute> upRoutes, GlobalKey<NavigatorState>? parentNavigatorKey) {
    List<RouteBase> routes = upRoutes
        .map(
          (e) => GoRoute(
            // parentNavigatorKey: parentNavigatorKey,
            path: e.path,
            builder: (BuildContext context, GoRouterState state) =>
                e.pageBuilder(
              context,
              UpRouterState(
                params: state.params,
                extra: state.extra,
                queryParametersAll: state.queryParametersAll,
                queryParams: state.queryParams,
              ),
            ),
            name: e.name,
            routes: e.routes != null && e.routes!.isNotEmpty
                ? generateRoutes(
                    e.routes!,
                    parentNavigatorKey,
                  )
                : <RouteBase>[],
            redirect: (context, state) async {
              if (e.shouldRedirect != null && e.redirectRoute != null) {
                if (e.shouldRedirect!()) {
                  Uri uri = Uri.base;
                  if (!e.externalRoute) {
                    String route = e.redirectRoute!;
                    if (uri.fragment.isNotEmpty) {
                      route += "?redirecturl=${uri.fragment}";
                    }
                    return route;
                  } else {
                    if (e.redirectRoute != null) {
                      UpUrlService().openUrl(
                          "${e.redirectRoute}?redirecturl=${Uri.parse('${uri.origin}/#${uri.fragment}')}",
                          webOnlyWindowName: "_self");
                      return null;
                    }
                  }
                } else {
                  return null;
                }
              } else {
                return null;
              }
              return null;
            },
          ),
        )
        .toList();

    return routes;
  }
}
