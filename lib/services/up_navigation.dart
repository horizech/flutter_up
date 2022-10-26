import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // late final String initialRoute;

  navigateTo(String routeName, {bool replace = false, dynamic arguments}) {
    if (replace) {
      if (arguments != null) {
        navigatorKey.currentContext!.replaceNamed(routeName, params: arguments);
      } else {
        navigatorKey.currentContext!.replaceNamed(routeName);
      }
      // return navigatorKey.currentState!
      //     .popAndPushNamed(routeName, arguments: arguments);
    } else {
      if (arguments != null) {
        (navigatorKey.currentContext!).goNamed(routeName, params: arguments);
      } else {
        (navigatorKey.currentContext!).goNamed(routeName);
      }
      // return navigatorKey.currentState!
      //     .pushNamed(routeName, arguments: arguments);
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
