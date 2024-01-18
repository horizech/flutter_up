import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // late final String initialRoute;

  navigateToNamed(
    String routeName, {
    bool replace = false,
    Map<String, String>? params,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? extra,
  }) {
    if (navigatorKey.currentContext != null) {
      if (replace) {
        navigatorKey.currentContext!.goNamed(
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

  navigateTo({
    required String path,
    bool replace = false,
  }) {
    if (navigatorKey.currentContext != null) {
      if (replace) {
        navigatorKey.currentContext!.replace(
          path,
        );
      } else {
        (navigatorKey.currentContext!).go(
          path,
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
    /*
    if (result != null) {
      // navigatorKey.currentState!.popUntil(ModalRoute.withName(initialRoute));
      // navigatorKey.currentContext!.pop();

    } else {
      navigatorKey.currentContext!.pop();
    }
    */
  }
}
