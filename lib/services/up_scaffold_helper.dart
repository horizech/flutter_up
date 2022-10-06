import 'package:flutter/material.dart';

class UpScaffoldHelperService {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey {
    return _scaffoldKey;
  }

  showSnackBar(String text) {
    // _scaffoldKey.currentState. showSnackBar(
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1000), content: Text(text)));
  }
}
