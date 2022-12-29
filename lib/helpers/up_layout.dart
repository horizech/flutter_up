import 'package:flutter/cupertino.dart';
import 'package:flutter_up/contants.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_layout.dart';

class UpLayout {
  static bool isPortrait(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (height > width) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLandscape(BuildContext context) {
    bool isLandscap = isPortrait(context);
    return !isLandscap;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <
      (ServiceManager<UpLayoutService>().mobileLimit ??
          UpConstants.kDefaultMobileLimit);
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <
          (ServiceManager<UpLayoutService>().tabletLimit ??
              UpConstants.kDefaultTabletLimit) &&
      MediaQuery.of(context).size.width >=
          (ServiceManager<UpLayoutService>().mobileLimit ??
              UpConstants.kDefaultMobileLimit);

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >=
      (ServiceManager<UpLayoutService>().tabletLimit ??
          UpConstants.kDefaultTabletLimit);
}
