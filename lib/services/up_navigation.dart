import 'package:flutter/material.dart';

class UpNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // late final String initialRoute;

  Future<dynamic> navigateTo(String routeName,
      {bool replace = false, dynamic arguments}) {
    if (replace) {
      return navigatorKey.currentState!
          .popAndPushNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  goBack({result}) {
    if (result != null) {
      // navigatorKey.currentState!.popUntil(ModalRoute.withName(initialRoute));

      navigatorKey.currentState!.pop(result);
    } else {
      navigatorKey.currentState!.pop();
    }
  }
}
