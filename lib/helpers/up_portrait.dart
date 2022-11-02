import 'package:flutter/cupertino.dart';

bool upIsPortrait(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  if (height > width) {
    return true;
  } else {
    return false;
  }
}
