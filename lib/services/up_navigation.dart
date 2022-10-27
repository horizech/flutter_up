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
  }) {
    if (replace) {
      if (params != null && queryParams != null) {
        navigatorKey.currentContext!.replaceNamed(
          routeName,
          params: params,
          queryParams: queryParams,
        );
      } else {
        if (params != null) {
          (navigatorKey.currentContext!).goNamed(
            routeName,
            params: params,
          );
        } else if (queryParams != null) {
          (navigatorKey.currentContext!).goNamed(
            routeName,
            queryParams: queryParams,
          );
        } else {
          navigatorKey.currentContext!.replaceNamed(
            routeName,
          );
        }
      }
    } else {
      if (params != null && queryParams != null) {
        (navigatorKey.currentContext!).goNamed(
          routeName,
          params: params,
          queryParams: queryParams,
        );
      } else {
        if (params != null) {
          (navigatorKey.currentContext!).goNamed(
            routeName,
            params: params,
          );
        } else if (queryParams != null) {
          (navigatorKey.currentContext!).goNamed(
            routeName,
            queryParams: queryParams,
          );
        } else {
          (navigatorKey.currentContext!).goNamed(
            routeName,
          );
        }
      }
      // return navigatorKey.currentState!
      //     .pushNamed(routeName, arguments: arguments);
    }
  }

  navigateTo({
    required String path,
    bool replace = false,
  }) {
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

  goBack({result}) {
    if (navigatorKey.currentContext!.canPop()) {
      navigatorKey.currentContext!.pop();
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
