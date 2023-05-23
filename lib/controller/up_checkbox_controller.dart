import 'package:flutter/material.dart';

class UpCheckBoxController extends ChangeNotifier {
  bool value;

  UpCheckBoxController({this.value = false});

  void updateValue(bool value) {
    this.value = value;
    notifyListeners();
  }
}
