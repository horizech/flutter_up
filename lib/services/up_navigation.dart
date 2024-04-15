import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigateToNamed(
    String routeName, {
    bool replace = false,
    Map<String, String>? params,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? extra,
  }) {
    if (navigatorKey.currentContext != null) {
      if (replace) {
        navigatorKey.currentContext!.pushReplacementNamed(
          routeName,
          extra: extra ?? {},
          params: params ?? {},
          queryParams: queryParams ?? {},
        );
      } else {
        (navigatorKey.currentContext!).goNamed(
          routeName,
          params: params ?? {},
          queryParams: queryParams ?? {},
          extra: extra ?? {},
        );
      }
    }
  }

  navigate({required String path, bool replace = false, Object? extra}) {
    if (navigatorKey.currentContext != null) {
      if (replace) {
        navigatorKey.currentContext!.replace(
          path,
          extra: extra,
        );
      } else {
        (navigatorKey.currentContext!).go(
          path,
          extra: extra,
        );
      }
    }
  }

  goBack() {
    if (navigatorKey.currentContext != null) {
      if (navigatorKey.currentContext!.canPop()) {
        navigatorKey.currentContext!.pop();
      }
    }
  }
}
