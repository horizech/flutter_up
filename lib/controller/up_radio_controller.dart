import 'package:flutter/material.dart';

class UpRadioController extends ChangeNotifier {
  dynamic value;

  UpRadioController({this.value});

  void updateValue(dynamic value) {
    this.value = value;
    notifyListeners();
  }
}
