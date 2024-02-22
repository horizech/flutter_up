import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesHelper {
  static Uri getCurrentUri(BuildContext context) {
    return GoRouter.of(context).routeInformationProvider.value.uri;
  }

  static String getCurrentPath(BuildContext context) {
    return GoRouterState.of(context).path ?? "";
  }

  static String getCurrentNamedPath(BuildContext context) {
    return GoRouterState.of(context).name ?? "";
  }
}
