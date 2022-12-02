import 'package:flutter/cupertino.dart';

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
}
