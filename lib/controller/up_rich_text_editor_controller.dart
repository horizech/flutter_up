import 'package:flutter/material.dart';

class UpRichTextEditorController extends ChangeNotifier {
  String text;

  UpRichTextEditorController({this.text = ""});

  void updateValue(String text) {
    this.text = text;
    notifyListeners();
  }
}
