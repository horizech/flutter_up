import 'package:flutter/material.dart';

class UpCheckboxController extends ChangeNotifier {
  bool value;

  UpCheckboxController({this.value = false});

  void updateValue(bool value) {
    this.value = value;
    notifyListeners();
  }
}
